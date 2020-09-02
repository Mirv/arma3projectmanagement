rem "Kills all tasks that originate from the target directory"
rem https://stackoverflow.com/questions/36142787/how-to-kill-running-process-from-a-specific-folder-via-batch-file

FOR /F "delims=" %%G in ('FORFILES /P "%C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server" /M *.EXE /S') DO (
    TASKKILL /F /IM %%G /T
)

del "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\@ELDB\Addons\A3_killLog.pbo"
