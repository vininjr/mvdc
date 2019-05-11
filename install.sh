#!/bin/bash

############################################################################################################
# Descompress files
# Autor: Marcus Vinicius Martins Melo
# Visit: https://vininjr.github.io
############################################################################################################

if [[ $EUID -ne 0 ]]; then
   echo "superuser privileges are required" 1>&2
   exit 1
fi

if ! type which tar > /dev/null; then
	sudo apt install tar -y
fi

if ! type which unzip > /dev/null; then
	sudo apt install unzip -y
fi

if ! type which unrar > /dev/null; then
	sudo apt install unrar -y
fi

if ! type which gzip > /dev/null; then
	sudo apt install gzip -y
fi

if ! type which bzip2 > /dev/null; then
	sudo apt install bzip2 -y
fi

sudo cp mvdc-main.py /usr/bin/mvdc
sudo chmod +x /usr/bin/mvdc
