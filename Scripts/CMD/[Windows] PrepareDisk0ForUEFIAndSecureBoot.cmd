:START

@ECHO OFF

:DISCLAIMER

ECHO.
ECHO *************************************************************
ECHO *                                                           *
ECHO *  PrepareDisk0ForUEFIAndSecureBoot script                  *
ECHO *                                                           *
ECHO *  This script will clear the content fo disk 0             *
ECHO *  and create a single primary partition on it.             *
ECHO *                                                           *
ECHO *  ALL DATA ON DISK 0 WILL BE DELETED!                      *
ECHO *                                                           *
ECHO *  To CANCEL the script press Ctrl-C now.                   *
ECHO *                                                           *
ECHO *  Otherwise press any key to continue . . .                *
ECHO *                                                           *
ECHO *************************************************************
ECHO.
PAUSE > NUL

ECHO Setting up execution variables...
ECHO.

:INITIALIZATION

SET SCRIPTFOLDER=%~dp0
SET SCRIPTFOLDER=%SCRIPTFOLDER:~0,-1%
SET CONFIGFILE="[Windows] PrepareDisk0ForUEFIAndSecureBoot.txt"

:DISKPART

ECHO Executing diskpart command
ECHO     Command line: diskpart /s "%SCRIPTFOLDER%\%CONFIGFILE%"

diskpart /s "%SCRIPTFOLDER%\%CONFIGFILE%"

ECHO.
ECHO Done.
ECHO.

:END_SCRIPT

SET SCRIPTFOLDER=
SET CONFIGFILE=

::EXIT /B %SCRIPTRETURN%
