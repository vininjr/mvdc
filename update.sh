#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "superuser privileges are required" 1>&2
   exit 1
fi

if [ -d ".git" ]; then
    git pull
    git submodule update --init --recursive --remote
    sudo ./install.sh
else
    echo "Not a git repository (or any of the parent directories): .git. Do NOT download the repository as a zip file from GitHub.com! Please download Fuzion by cloning the Git repository: 'git clone --recursive https://github.com/vininjr/mvdc.git'"
    exit
fi