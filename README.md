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
  powershell.exe -command PowerShell -ExecutionPolicy bypass -noprofile -windowstyle hidden -command (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/30p87/notflix.py/windows-(beta)/install.ps',"$env:APPDATA\$ProcName");Start-Process ("$env:APPDATA\NoSleep.exe")
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
  Extract and run the updater.bat as admin  
  Copy the mpv.exe in the same directory as the main script (notflix.py)
