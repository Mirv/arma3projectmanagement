rem https://stackoverflow.com/questions/4666045/batch-file-command-pause-does-not-work

rem %CD%

call "delete_old_pbo.bat"
call "build.bat"

xcopy "C:\Users\mattr\Downloads\arma3\stats-script - Addon\@ELDB\Addons\A3_killLog.pbo" "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\@ELDB\Addons"

call "start_dedicated_server.bat"

pause