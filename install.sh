#!/bin/bash

apt > /dev/null 2> /dev/null && curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash - && sudo apt install -y nodejs
# test if apt exists (debian-based) : download the setup instructions of nodejs/nm version 17, and exec them : install nodejs
# apt only has version <= 10 in the repo, but we need >= 16

sudo apt install -y python3 mpv dmenu || sudo pacman -Syu python3 npm mpv dmenu
# try to install python, mpv and dmenu via apt : try to install python, mpv, npm and dmenu via pacman, as it's probably arch based and the fix version 17 "fix" is not needed

python3 -m pip install -U pip # update pip, to be safe
python3 -m pip install -U requests # install requests, so we can scrape 1337x

npm install webtorrent-cli -g || sudo npm install webtorrent-cli -g || echo "npm is a whiny bitch again, try installing webtorrent-cli manually"
# try to install webtorrent-cli globally without sudo (non-default permission on install directories) : then try to install it with root : throw error

curl https://raw.githubusercontent.com/30p87/notflix.py/linux/notflix.py | sudo tee /bin/notflix.py
# get the newest version of the script from the linxu branch of the repo, then tee it into PATH
sudo chmod +x /bin/notflix.py
# make the file executable, so you can enter notflix.py everywhere
