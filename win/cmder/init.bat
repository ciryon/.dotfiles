:: Init Script for cmd.exe
:: Sets some nice defaults
:: Created as part of cmder project

:: Find root dir
@if not defined CMDER_ROOT (
    for /f %%i in ("%ConEmuDir%\..\..") do @set CMDER_ROOT=%%~fi
)

:: Change the prompt style
:: Mmm tasty lamb
@prompt $E[1;32;40m$P$S{git}$S$_$E[1;30;40m{lamb}$S$E[0m

:: Pick right version of clink
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set architecture=86
) else (
    set architecture=64
)

:: Run clink
@"%CMDER_ROOT%\vendor\clink\clink_x%architecture%.exe" inject --quiet --profile "%CMDER_ROOT%\config"

:: Prepare for msysgit

:: I do not even know, copypasted from their .bat
@set PLINK_PROTOCOL=ssh
@if not defined TERM set TERM=cygwin

:: Enhance Path
@set git_install_root=%CMDER_ROOT%\vendor\msysgit
@set PATH=C:\tools\vim;%CMDER_ROOT%\bin;%git_install_root%\bin;%git_install_root%\mingw\bin;%git_install_root%\cmd;%CMDER_ROOT%;%PATH%

:: Set home path
@if not defined HOME set HOME=%USERPROFILE%

@if defined CMDER_START (
    @cd /d "%CMDER_START%"
) else (
    @if "%CD%\" == "%CMDER_ROOT%" (
        @cd /d "%HOME%"
    )
)

:: Add aliases
@doskey /macrofile="%CMDER_ROOT%\config\aliases"
:: For some reason this aliases file can't be, uh, aliased (symlinked)
:: So I'll just add some aliases using doskey, right here:
@doskey g=git $*
@doskey gf=git flow $*
@doskey r=rails $*
@doskey be=bundle exec $*
@doskey which=where $*
@doskey open=explorer $*
@doskey co=cd %HOME%/Documents/Coding
@doskey date=ruby -e 'puts Time.now'
@doskey ~=cd %homepath%
@doskey far= "c:\Program Files\Far Manager\Far.exe" $*
@doskey reboot=@powershell -c (New-Object Media.SoundPlayer "C:\Users\Christian\OneDrive\Music\Ljudfiler\Effects\bye-bye-1.wav").PlaySync(); shutdown -r
@doskey subs=git submodule update --init --recursive

