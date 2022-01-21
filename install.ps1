Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -OutFile $Env:USERPROFILE\AppData\Local\Temp\python_install.exe
Invoke-WebRequest -Uri https://nodejs.org/dist/v17.4.0/node-v17.4.0-x64.msi -OutFile $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi
Invoke-WebRequest -Uri https://netcologne.dl.sourceforge.net/project/mpv-player-windows/64bit/mpv-x86_64-20220116-git-1ba0547.7z -OutFile $Env:USERPROFILE\AppData\Local\Temp\mpv_install.7z

Invoke-Expression "$Env:USERPROFILE\AppData\Local\Temp\test.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0"
msiexec /qn /l* C:\node-log.txt /i $Env:USERPROFILE\AppData\Local\Temp\nodejs_install.msi

<#
sudo apt install -y python3 npm nodejs mpv
sudo pacman -Syu python3 npm mpv

python3 -m pip install -U pip
python3 -m pip install -U requests

npm install webtorrent-cli -g || sudo npm install webtorrent-cli -g || echo "npm is a whiny bitch again, try installing webtorrent-cli manually"

curl https://raw.githubusercontent.com/30p87/notflix.py/main/notflix.py | sudo tee /bin/notflix.py
sudo chmod +x /bin/notflix.py
#>
