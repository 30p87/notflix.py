apt > /dev/null 2> /dev/null && curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash - && sudo apt install -y nodejs

sudo apt install -y python3 mpv || sudo pacman -Syu python3 npm mpv

python3 -m pip install -U pip
python3 -m pip install -U requests

npm install webtorrent-cli -g || sudo npm install webtorrent-cli -g || echo "npm is a whiny bitch again, try installing webtorrent-cli manually"

curl https://raw.githubusercontent.com/30p87/notflix.py/linux/notflix.py | sudo tee /bin/notflix.py
sudo chmod +x /bin/notflix.py
