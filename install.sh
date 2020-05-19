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

sudo cp mvdc.sh /usr/bin/mvdc
sudo chmod +x /usr/bin/mvdc