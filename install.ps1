Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe" -OutFile $Env:USERPROFILE\AppData\Local\Temp\python_install.exe
Invoke-WebRequest -Uri "https://nodejs.org/dist/v17.4.0/node-v17.4.0-x64.msi" -OutFile $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi
Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z2107-x64.exe" -OutFile $Env:USERPROFILE\AppData\Local\Temp\7z_install.exe
Invoke-WebRequest -Uri "https://netcologne.dl.sourceforge.net/project/mpv-player-windows/64bit/mpv-x86_64-20220116-git-1ba0547.7z" -OutFile $Env:USERPROFILE\AppData\Local\Temp\mpv_install.7z

Start-Process "$Env:USERPROFILE\AppData\Local\Temp\python_install.exe" "/quiet InstallAllUsers=1 PrependPath=1 Include_test=0" -wait
msiexec /qn /l* C:\node-log.txt /i $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi
Start-Process "$Env:USERPROFILE\AppData\Local\Temp\7z_install.exe" "/S" -wait
If ((Test-Path "$Env:USERPROFILE\AppData\Local\Temp\mpv_install") -eq $True) {
  Remove-Item "$Env:USERPROFILE\AppData\Local\Temp\mpv_install" -Force -Recurse
}
Start-Process "$env:ProgramFiles\7-Zip\7z.exe" "x -o$Env:USERPROFILE\AppData\Local\Temp\mpv_install $Env:USERPROFILE\AppData\Local\Temp\mpv_install.7z -r" -wait

py -m pip install -U pip
py -m pip install requests

If ((Test-Path "$Env:AppData\notflix.py") -eq $False) {
  mkdir $Env:AppData\notflix.py
}

cp $Env:USERPROFILE\AppData\Local\Temp\mpv_install\mpv.exe $Env:AppData\notflix.py
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/30p87/notflix.py/windows-(beta)/notflix.py" -OutFile $Env:AppData\notflix.py\notflix.py

$is = $False
foreach ($_path in ($Env:PATH).split(";")) {
  If ("$_path" -match "notflix.py") {
    $is = $True
  }
}

If ($is -eq $False) {
  $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
  $newpath = "$oldpath;$Env:AppData\notflix.py"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath
}
