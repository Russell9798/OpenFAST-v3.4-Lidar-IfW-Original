@ECHO off
SET IncludeFile=..\gitVersionInfo.h

<NUL SET /p IncludeTxt=#define GIT_VERSION_INFO '> %IncludeFile%
FOR /f %%a IN ('git describe --abbrev^=8 --always --tags --dirty') DO <NUL SET /p IncludeTxt=%%a>> %IncludeFile%
git describe --abbrev^=8 --always --tags --dirty > NUL
IF %ERRORLEVEL%==0 ( ECHO '>> %IncludeFile% ) else ( ECHO Unversioned from e8ec53f9c7f9d3f6a13bfb61dba12a0ca04d8a2f '>> %IncludeFile% )

EXIT /B 0