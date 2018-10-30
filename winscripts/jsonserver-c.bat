REM @ECHO OFF
SETLOCAL
REM Start JSONServer Container
REM Usage jsonserver-c directory [rideport]

SET pname=%~0

IF "%1"=="" (GOTO USAGE) ELSE (SET folder="%~f1")
IF "%2"=="" (SET httpport=8080) ELSE (SET httpport=%2)
IF NOT EXIST %folder% (GOTO NOTEXIST) ELSE (
  IF %3=="" (
     START docker run -p %httpport%:8080 -it -v %folder%:/app dyalog/jsonserver:dbg
     ) ELSE (
     START docker run -p %httpport%:8080 -p %3:4502 -it -v %folder%:/app dyalog/jsonserver:dbg
     )
  IF NOT %ERRORLEVEL%==0 (GOTO Exit) ELSE (
     START http://localhost:%httpport%
     goto DONE
  )
)

:ERROR
ECHO "%pname% Docker returned error %ERRORLEVEL%"
goto DONE

:USAGE
ECHO "Usage: %pname% directory [httpport] [rideport]"
goto DONE

:NOTEXIST
ECHO "%pname%: File/folder %folder% does not exist"
goto DONE

:DONE