# notflix.py
A rewrite of [bugswriters](https://www.youtube.com/results?search_query=bugwriter) [notflix](https://github.com/Bugswriter/notflix) in python, and therefore for every os (in theory), cuz a friend wanted it lol


# Tested for:
  - Windows 10


# Dependencies:
- Python
  - requests
- webtorrent-cli
  - nodejs
- MPV


  
# Installation
## Automatic  
  - Press WIN+R
  - Enter:  
  powershell.exe -command PowerShell -ExecutionPolicy bypass -noprofile -windowstyle hidden -command (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/30p87/notflix.py/windows-(beta)/install.ps1'," $Env:USERPROFILE\AppData\Local\Temp\install.ps1");Start-Process ("$Env:USERPROFILE\AppData\Local\Temp\install.ps1")
## Manual
- Python  
  https://www.python.org/downloads/
- Requests  
  py -m pip install requests
- NodeJS & NPM  
  https://nodejs.org/en/download/
- Webtorrent  
  npm install webtorrent-cli -g
- MPV  
  https://sourceforge.net/projects/mpv-player-windows/  
  Extract and copy the mpv.exe in the same directory as the main script (notflix.py)
