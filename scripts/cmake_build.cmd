:: This keyword REM is the official way to add comment in a batch file.
:: Since the REM comments are considered as valid by windows batch script, they get printed when ECHO is turned ON. 
:: Hence, at times when ECHO is ON, :: comments to get printed at all.

:: The below line turns off printing (ECHO'ing) of each batch file line.
:: The @ is a special operator to suppress printing of the command line. Once we set ECHO'ing to OFF, we do not need the @ operator again in the script commands.
@ECHO OFF

:: Printing of commands in the script can be restored using the below command (commented as of now to avoid conflict with the above statement).
:: ECHO ON

:: SET command assigns a value to a variable. Do not use whitespace between the name and the value; SET foo = bar will not work. But, SET foo=bar will work.
:: %~dp0 gives the root path of the script being executed from. Here <path-to-project>\CPP_Primer\scripts\
:: Since, I want to set the root path of the project one directory higher .. is used.
SET CPP_PRIMER_WS_PATH=%~dp0..

:: The value of a variable can be read by prefixing and suffixing the variable name with % operator. Here, I have obtained the value of this projects workspace path to navigate to the build folder and save it in a variable called BUILD_DIR.
SET BUILD_DIR=%CPP_PRIMER_WS_PATH%\source_code\build

:: cd means change directory.
:: /d means change the drive if the target path is on a different drive.
:: The CMake should run from the build directory and hence before the CMake is executed, we have to navigate to that path.
cd /d "%BUILD_DIR%"

:: =====Run CMake=====
:: CMake executable is called through cmake keyword. There are many arguments to this cmake, a few used ones are listed below with explanation.
:: -S <path-to-source-tree> - the source tree must contain the CMakeLists.txt file at the root of its path.
:: -B <path-to-build-tree> - the build tree will be created automatically if it does not already exist.
:: -G <generator-name> - specify a build system generator like Ninja, MinGW Makefiles. Refer to cmake-generators(7) manual for more details.
:: -D<VAR>=<VALUE> - In CMake, -D means "Define a CMake cache variable". When a value is passed, it stores <VALUE> in its CMake cache (CMakeCache.txt) under the name <VAR>.
cmake -S %CPP_PRIMER_WS_PATH%\source_code ^
    -B "%BUILD_DIR%" ^
    -G "MinGW Makefiles"
