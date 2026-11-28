@echo off
setlocal
pushd "%~dp0" || exit /b 1

if exist "jre\bin\java.exe" (
    set "JAVA_EXE=%CD%\jre\bin\java.exe"
    goto run
)
if defined JAVA_HOME (
    if not exist "%JAVA_HOME%\bin\java.exe" goto bad_java_home
    set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
    goto run
)
where java.exe >nul 2>&1
if errorlevel 1 goto no_java
set "JAVA_EXE=java.exe"

:run
"%JAVA_EXE%" -Xmx400000000 "-Djava.library.path=./lib" "-Dcogtool.version=@VERSION@" "-Dcogtool.revision=@REVISION@" "-Dcogtool.build=@BUILDTIME@" -jar "CogTool.jar" %*
if errorlevel 1 (
    echo CogTool could not start or exited with an error. Check the Java version and architecture.
    pause
    popd
    exit /b 1
)
popd
exit /b 0

:bad_java_home
echo JAVA_HOME does not point to a Java runtime with bin\java.exe.
goto java_error

:no_java
echo Java was not found. Install a Windows Java runtime or set JAVA_HOME.

:java_error
echo See README.txt for the required Java version and architecture.
pause
popd
exit /b 1
