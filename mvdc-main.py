#!/usr/bin/python3

import os
import re
import sys
import subprocess

def match_extension(file):
	if file[0] == '.tar' and file[1] == '.gz':
		return "tar -zxvf"
	elif file[0] == '.tar' and file[1] == '.bz2':
		return "tar -jxvf"
	elif file[0] == '.tar' and file[1] == '.bz':
		return "tar -xjf"
	elif file[0] == '.tar':
		return 'tar -xvf'
	elif file[0] == '.bz2':
		return "bzip2 -d"
	elif file[0] == '.gz':
		return "gzip -d"
	elif file[0] == '.tgz':
		return "tar -xvzf"
	elif file[0] == '.tbz2':
		return "tar -jxvf"
	elif file[0] == '.zip':
		return "unzip"
	elif file[0] == '.rar':
		return "unrar e"
	sys.exit("format not supported.")

if __name__ == "__main__":
	if(len(sys.argv) < 2): sys.exit("warning:\n\tnot file to descompress.\n\nspecify the file or path to the file.")
	filename = str(sys.argv[1])
	ext = r'\.\w{1,6}'
	file_extension = re.findall(f'{ext}\\b | {ext}', filename,  re.X)
	if len(file_extension) < 2: file_extension.append('')
	command_descompress = match_extension(file_extension) + " " + filename
	os.chdir(os.getcwd())
	subprocess.call(command_descompress, shell = True, stdout=subprocess.PIPE)
	sys.exit(0)
sys.exit(0)