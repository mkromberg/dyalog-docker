@ECHO OFF
SETLOCAL
REM Start Dyalog Container
REM Usage dyalog-c directory [rideport]

SET pname=%~0

IF "%1"=="" (GOTO USAGE) ELSE (SET folder="%~f1")
IF "%2"=="" (SET rideport=4502) ELSE (SET rideport=%2)
IF NOT EXIST %folder% (GOTO NOTEXIST) ELSE (
  START docker run -p %rideport%:4502 -it -v %folder%:/app dyalog/dyalog:17.1-dbg
  IF NOT %ERRORLEVEL%==0 (GOTO Exit) ELSE (
     START http://localhost:%rideport%
     goto DONE
  )
)

:ERROR
ECHO "%pname% Docker returned error %ERRORLEVEL%"
goto DONE

:USAGE
ECHO "Usage: %pname% directory [rideport]"
goto DONE

:NOTEXIST
ECHO "%pname%: File/folder %folder% does not exist"
goto DONE

:DONE