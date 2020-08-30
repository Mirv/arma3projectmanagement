:: https://stackoverflow.com/questions/47031941/xcopy-overwrite-all-without-prompt-in-batch
:: https://ss64.com/nt/xcopy.html
:: Note don't ever put '::' in code blocks

:: Runs an update of all files in the destination directory & suppresses over write prompt

:: Must place batch file in the directory with the source files

xcopy "*.*" "C:\Users\mattr\Downloads\arma3\stats-script\@ELDB\Addons" /Y /S /I /U /D

:: Note, after you're sure you're happy with it - comment out the pause or remove this section
pause