# notflix.py
A rewrite of [bugswriters](https://www.youtube.com/results?search_query=bugwriter) [notflix](https://github.com/Bugswriter/notflix) in python, and therefore for every os (in theory), cuz a friend wanted it lol


# Tested for:
  - Linux (Pop!\_OS 21.10)
  - Windows 10



# Dependencies:
- Python
  - requests
- webtorrent-cli
  - nodejs
- MPV


  
## Windows
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


## Linux
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

TIP:
  You can 'install' the script by moving it into /bin:
    sudo mv notflix.py /bin
