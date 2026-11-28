import java.util.Arrays;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import edu.cmu.cs.hcii.cogtool.model.ACTRTraceParser;
import edu.cmu.cs.hcii.cogtool.model.ResultStep;

/** Checks eye-movement parsing for ACT-R 6 and the ACT-R 7 EMMA trace. */
public class ACTR7TraceSmoke {
    private static void check(String module, String position) {
        List<ResultStep> steps = new ACTRTraceParser().parseTrace(Arrays.asList(
            "  0.100   " + module + "   PREPARE-EYE-MOVEMENT",
            "  0.250   " + module + "   Preparation-complete TEXT0",
            "  0.380   " + module + "   Complete-eye-movement TEXT0 " + position));
        if (steps.size() != 2) throw new AssertionError("Expected two eye steps: " + steps);
        ResultStep preparation = steps.get(0);
        ResultStep movement = steps.get(1);
        if (!ResultStep.VISION_PREP_RESOURCE.equals(preparation.resource) ||
            !ResultStep.VISION_EXEC_RESOURCE.equals(movement.resource) ||
            Math.abs(preparation.duration - 150) > 0.001 ||
            Math.abs(movement.duration - 130) > 0.001 ||
            !movement.operation.equals("Eye Movement to (430, 456)")) {
            throw new AssertionError("Unexpected eye movement: " + steps);
        }
    }

    public static void main(String[] args) throws Exception {
        check("VISION", "#(430 456)");
        check("EMMA", "#(430 456 1080)");
        if (args.length > 0) {
            List<ResultStep> steps = new ACTRTraceParser().parseTrace(
                Files.readAllLines(Paths.get(args[0]), StandardCharsets.UTF_8));
            int preparations = 0;
            int movements = 0;
            for (ResultStep step : steps) {
                if (ResultStep.VISION_PREP_RESOURCE.equals(step.resource)) preparations++;
                if (ResultStep.VISION_EXEC_RESOURCE.equals(step.resource)) movements++;
            }
            if (preparations < 1 || preparations != movements) {
                throw new AssertionError("Missing EMMA eye steps in real trace: " + steps);
            }
        }
        System.out.println("ACT-R eye-movement trace parsing passed");
    }
}
