Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -OutFile $Env:USERPROFILE\AppData\Local\Temp\python_install.exe
Invoke-WebRequest -Uri https://nodejs.org/dist/v17.4.0/node-v17.4.0-x64.msi -OutFile $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi
Invoke-WebRequest -Uri https://www.7-zip.org/a/7z2107-x64.exe -OutFile $Env:USERPROFILE\AppData\Local\Temp\7z_install.exe
Invoke-WebRequest -Uri https://netcologne.dl.sourceforge.net/project/mpv-player-windows/64bit/mpv-x86_64-20220116-git-1ba0547.7z -OutFile $Env:USERPROFILE\AppData\Local\Temp\mpv_install.7z

& "$Env:USERPROFILE\AppData\Local\Temp\python_install.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
msiexec /qn /l* C:\node-log.txt /i $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi
& "$Env:USERPROFILE\AppData\Local\Temp\7z_install.exe" /S
& "$env:ProgramFiles\7-Zip\7z.exe" x -o"$Env:USERPROFILE\AppData\Local\Temp\mpv_install" $Env:USERPROFILE\AppData\Local\Temp\mpv_install.7z -r
