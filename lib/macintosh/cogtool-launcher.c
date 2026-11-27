/* Native app entry point for Launch Services. Keep Java selection in the
 * bundled shell script, and preserve arguments when handing control to it. */
#include <mach-o/dyld.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    char executable[PATH_MAX];
    char resolved[PATH_MAX];
    char script[PATH_MAX];
    uint32_t size = sizeof(executable);
    if (_NSGetExecutablePath(executable, &size) != 0 ||
        realpath(executable, resolved) == NULL) {
        fputs("CogTool: cannot locate its executable.\n", stderr);
        return 1;
    }
    char *slash = strrchr(resolved, '/');
    if (slash == NULL) {
        return 1;
    }
    *slash = '\0';
    int written = snprintf(script, sizeof(script), "%s/../Resources/cogtoolstart", resolved);
    if (written < 0 || (size_t) written >= sizeof(script)) {
        fputs("CogTool: bundle path is too long.\n", stderr);
        return 1;
    }
    char **args = calloc((size_t) argc + 2, sizeof(*args));
    if (args == NULL) {
        perror("CogTool");
        return 1;
    }
    args[0] = "/bin/bash";
    args[1] = script;
    for (int i = 1; i < argc; ++i) {
        args[i + 1] = argv[i];
    }
    execv(args[0], args);
    perror("CogTool: cannot start launcher");
    free(args);
    return 1;
}
