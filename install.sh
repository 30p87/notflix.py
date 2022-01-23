#!/bin/bash

brew install python3 mpv webtorrent-cli

pip3 install -U pip
pip3 install -U requests

# try to install python and mpv via apt : try to install python, mpv and npm via pacman, as it's probably arch based and the fix version 17 "fix" is not needed

curl https://raw.githubusercontent.com/30p87/notflix.py/macos-(beta)/notflix.py | sudo tee /usr/local/bin/notflix.py
# get the newest version of the script from the linxu branch of the repo, then tee it into PATH
sudo chmod +x /usr/local/bin/notflix.py
# make the file executable, so you can enter notflix.py everywhere
