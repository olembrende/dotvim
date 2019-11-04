@echo off

IF "%3%"=="" GOTO Explicit
GOTO Exit

:Explicit
IF "%2%"=="" GOTO ImplicitDir
FINDSTR /P /I /R /S /N /C:"%~1" %2
GOTO Exit

:ImplicitDir
FINDSTR /P /I /R /S /N /C:"%~1" *.*
GOTO Exit

:Exit