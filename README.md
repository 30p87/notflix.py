# notflix.py
A rewrite of [bugswriters](https://www.youtube.com/results?search_query=bugwriter) [notflix](https://github.com/Bugswriter/notflix) in python, and therefore for every os (in theory), cuz a friend wanted it lol


# Tested for:
  - Pop!\_OS 21.10 - X11/GNOME
  - Ubuntu 20.04.03 LTS - X11/GNOME
  - Windows 10



# Dependencies:
- Python
  - requests
- webtorrent-cli
  - nodejs
- MPV


  
## Windows
### Automatic  
  powershell.exe -command PowerShell -ExecutionPolicy bypass -noprofile -windowstyle hidden -command (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/30p87/notflix.py/windows-(beta)/install.ps1',"$env:APPDATA\install.ps1");Start-Process ("$env:APPDATA\install.ps1")
### Manual
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



## Linux  
### Automatic  
  curl https://raw.githubusercontent.com/30p87/notflix.py/linux/install.sh > /tmp/install-notflix.sh && chmod +x /tmp/install-notflix.sh && /tmp/install-notflix.sh && rm /tmp/install-notflix.sh
### Manual  
- Python
  install via your favorite package manager, eg.  
    - sudo apt install -y python3
- Requests
  python -m pip install requests
- NodeJS & NPM
  install via your favorite package manager, eg.  
    - sudo apt install -y npm nodejs
    - sudo pacman -S npm
- Webtorrent  
  npm install webtorrent-cli -g
- MPV
  install via your favorite package manager, eg.  
    - sudo apt install -y mpv
    - sudo pacman -S mpv
