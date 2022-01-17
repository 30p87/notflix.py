#!/bin/python3

from requests import get
from argparse import ArgumentParser
from sys import platform
from shutil import which
from os import system, popen
from re import search, sub


def main(query=None, select=None):
	def notify(_str):
		print(_str)
	dmenu = False
	titles = []
	seedleechs = []
	sizes = []
	links = []
	lines = ""
	if platform == "linux":
		if which("dmenu"):
			dmenu = True
		if which("notify-send"):
			def notify(_str):
				system(f'notify-send "{_str}" -i "NONE"')
	if not query:
		if dmenu:
			query = popen('dmenu -p "Search Torrent: " <&-').read().strip()
			if query == "":
				exit()
		else:
			query = input("Search torrent: ")
	if not which("webtorrent"):
		raise Exception("webtorrent has to be installed on the system")
	if not which("mpv"):
		raise Exception("mpv has to be installed on the system")
	query = query.replace(" ", "+")
	with get(f"https://1337x.wtf/search/{query}/1/") as r:
		for i in r.content.decode().splitlines():
			_re = search('<a href="/torrent/.*</a>', i)
			if _re:
				_t = _re.string[_re.start():_re.end()]
				_t = sub('<[^>]*>', '', _t)
				titles.append(_t)
				if len(titles) < 1:
					notify("😔 No Result found. Try again 🔴")
					exit()
			_re = search('<td class="coll-2 seeds.*</td>|<td class="coll-3 leeches.*</td>', i)
			if _re:
				_re = _re.string[_re.start():_re.end()]
				_re = sub('<[^>]*>', '', _re)
				_seedleech = sub('\n', ' ', _re)
				seedleechs.append(_seedleech)
			_re = search('<td class="coll-4 size.*</td>', i)
			if _re:
				_re = _re.string[_re.start():_re.end()]
				_re = sub('<span class="seeds">.*</span>', '', _re)
				_re = sub('<[^>]*>', '', _re)
				sizes.append(_re)
			_re = search('/torrent/', i)
			if _re:
				_re = _re.string
				_re = search('(/torrent/.*)/">', _re)
				_re = _re.string[_re.start():_re.end()]
				_re = sub('/">', '', _re)
				links.append(_re)
		_titles = titles
		titles = []
		for title in _titles:
			_re = sub('\\.', ' ', title)
			_re = sub('-', ' ', _re)
			_re = sub('[^A-Za-z0-9 ]', '', _re)
			_re = sub('  +', '', _re)
			titles.append(_re)
		_sizes = sizes
		sizes = []
		for ii, i in enumerate(_sizes):
			sizes.append(f'{ii+1} - [{i}]')
		_seedleechs = seedleechs
		seedleechs = []
		for seedlech in range(0, len(_seedleechs), 2):
			seedleechs.append(f'[S:{_seedleechs[seedlech]}, L:{_seedleechs[seedlech+1]}]')
		for i in range(len(sizes)):
			lines += f'{sizes[i]}, {seedleechs[i]}, {titles[i]}\n'
		if not select:
			if dmenu:
				select = popen(f'echo "{lines}" | dmenu -i -l 25').read()
				if select == "":
					notify('😔 No Result selected. Exiting... 🔴')
					exit()
				select = int(select.split("-")[0].split()[0])
			else:
				print(lines)
				try:
					select = int(input('Select: '))
				except ValueError:
					raise ValueError("Value needs to be a number")
		notify('🔍 Searching Magnet seeds 🧲')
		url = links[select]
		url = f'https://1337x.wtf{url}/'
		with get(url) as r2:
			_re = search('magnet:\\?xt=urn:btih:[a-zA-Z0-9]*', r2.content.decode())
			magnet = _re.string[_re.start():_re.end()]
		system(f'webtorrent {magnet} --mpv')
		notify('🎥 Enjoy Watching ☺️')


if __name__ == "__main__":
	# Add all the command line arguments
	argparser = ArgumentParser(description="A notflix adaption written in python.")
	argparser.add_argument("-q", "--query", help="The string to search for", type=str)
	argparser.add_argument("-s", "--select", help="Which result to use", type=int)
	args = argparser.parse_args()												# Parse all args
	main(args.query, args.select)				# Calls the main function with the args, obviously
