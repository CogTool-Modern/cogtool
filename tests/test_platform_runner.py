"""Tests for platform selection and the platform suite's export validation."""
import contextlib
import importlib.util
import io
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile

HERE = Path(__file__).resolve().parent


def load(name, filename):
    spec = importlib.util.spec_from_file_location(name, HERE / filename)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


checker = load("prediction_checker", "check-project-times.py")
suite = load("platform_suite", "platform-suite.py")


class PlatformRunnerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.app = self.root / "CogTool"
        (self.app / "lib").mkdir(parents=True)
        (self.app / "CogTool.jar").touch()
        self.helper = self.root / "helper"
        self.helper.mkdir()
        (self.helper / "ProjectPredictions.class").touch()
        self.projects = self.root / "projects"
        self.projects.mkdir()
        (self.projects / "sample.cgt").touch()
        (self.projects / "expected-times.csv").write_text(
            "project,task,design,seconds,tolerance\nsample.cgt,Task,Design,2.5,0.05\n", encoding="utf-8")

    def check_windows(self, requested, swt_arch):
        with zipfile.ZipFile(self.app / "lib/swt.jar", "w") as jar:
            jar.writestr("META-INF/MANIFEST.MF", f"Manifest-Version: 1.0\r\nSWT-Arch: {swt_arch}\r\n")
        class Result:
            returncode = 0
            stdout = "COGTOOL_PREDICTION VGFzaw== RGVzaWdu 2.5\n"
            stderr = ""
        argv = ["check-project-times.py", str(self.projects), "--app", str(self.app),
                "--platform", requested, "--helper", str(self.helper)]
        with patch.object(sys, "argv", argv), patch.object(sys, "platform", "win32"), \
             patch.object(checker, "find_java", return_value=Path("java.exe")), \
             patch.object(checker.subprocess, "run", return_value=Result()) as run, \
             contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            code = checker.main()
        return code, run

    def test_windows_amd64_uses_compiled_helper_directory(self):
        code, run = self.check_windows("windows-amd64", "x86_64")
        self.assertEqual(code, 0)
        self.assertIn(str(self.helper), run.call_args.args[0][3])

    def test_x86_does_not_accept_amd64_swt(self):
        code, run = self.check_windows("windows-x86", "x86_64")
        self.assertEqual(code, 2)
        run.assert_not_called()

    def test_windows_batch_quotes_shell_metacharacters(self):
        command = suite.windows_batch_command(r"C:\CogTool\CogTool.bat", [r"C:\repo\N&P93.cgt", "-q"])
        self.assertTrue(command.endswith(r'""C:\CogTool\CogTool.bat" "C:\repo\N&P93.cgt" "-q""'))
        with self.assertRaises(RuntimeError):
            suite.windows_batch_command(r"C:\%USER%\CogTool.bat", [])

    def test_export_requires_correct_results(self):
        export = self.root / "results.csv"
        export.write_text('"Tasks","Pop-Up","Dialog Box"\n'
                          '"Look up one number","2.6","13.1"\n'
                          '"Look up two numbers","4.9","20.9"\n')
        with contextlib.redirect_stdout(io.StringIO()):
            suite.check_export(export)
        export.write_text('"Tasks","Pop-Up","Dialog Box"\n'
                          '"Look up one number","2.6","13.1"\n'
                          '"Look up two numbers","4.9","99.9"\n')
        with self.assertRaisesRegex(RuntimeError, "Unexpected exported time"):
            suite.check_export(export)


if __name__ == "__main__":
    unittest.main()
