# notflix.py
A rewrite of [bugswriters](https://www.youtube.com/results?search_query=bugwriter) [notflix](https://github.com/Bugswriter/notflix) in python, and therefore for every os (in theory), cuz a friend wanted it lol


# Tested for:
  - Pop!\_OS 21.10 - X11/GNOME
  - Ubuntu 20.04.03 LTS - X11/GNOME



# Dependencies:
- Python
  - requests
- webtorrent-cli
  - nodejs
- MPV

# Installation
## Automatic  
  curl https://raw.githubusercontent.com/30p87/notflix.py/linux/install.sh | bash
## Manual  
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

## Optional:
  - Dmenu  
    install via your favorite package manager, eg.  
    - sudo apt install -y dmenu
