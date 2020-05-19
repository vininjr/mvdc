#!/bin/bash

##############################################################################
##                                                                          ##
##     mvdc is a file decompress manager easy and simpler for the linux.    ##
##                                                                          ##
##############################################################################

# Help
function help() {
  echo "usage: mvdc <file>"
  echo "	where file are [examples]:"
  echo "	bar.zip or bar.tar.gz"
  exit 1
}

if [ ! -r $1 ]; then
  help
fi

if [ $# -eq 0 ]; then
  help
fi

tipo=$(file -i $1 | grep zip:)
if [ ${#tipo} != 0 ]; then
  if ! type which unzip >/dev/null; then
    sudo apt install unzip -y
  fi
  unzip $1
fi
tipo=$(file -i $1 | grep tar:)
if [ ${#tipo} != 0 ]; then
  if ! type which tar >/dev/null; then
    sudo apt install tar -y
  fi
  tar -xvf $1
fi
tipo=$(file -i $1 | grep gz:)
if [ ${#tipo} != 0 ]; then
  tipo=$(file -i $1 | grep .tar.gz:)
  if [ ${#tipo} != 0 ]; then
    if ! type which tar >/dev/null; then
      sudo apt install tar -y
    fi
    tar -xzvf $1
  else
    tipo=$(file -i $1 | grep .tgz:)
    if [ ${#tipo} != 0 ]; then
      if ! type which tar >/dev/null; then
        sudo apt install tar -y
      fi
      tar -xzvf $1
    else
      if ! type which gzip >/dev/null; then
        sudo apt install gzip -y
      fi
      gzip -d $1
    fi
  fi
fi
tipo=$(file -i $1 | grep bz2)
if [ ${#tipo} != 0 ]; then
  if ! type which bzip2 >/dev/null; then
    sudo apt install bzip2 -y
  fi
  tipo=$(file -i $1 | grep .tar.bz2:)
  if [ ${#tipo} != 0 ]; then
    if ! type which tar >/dev/null; then
      sudo apt install tar -y
    fi
    bzip2 -dc $1 | tar -xv
  else
    bzip2 -d $1
  fi
fi
tipo=$(file -i $1 | grep .lzma)
if [ ${#tipo} != 0 ]; then
  if ! type which lzma >/dev/null; then
    sudo apt install lzma -y
  fi
  lzma -d $1
fi
tipo=$(file -i $1 | grep .rar)
if [ ${#tipo} != 0 ]; then
  if ! type which rar >/dev/null; then
    sudo apt install rar -y
  fi
  rar -x $1
fi
tipo=$(file -i $1 | grep .7z)
if [ ${#tipo} != 0 ]; then
  if ! type which p7zip-full >/dev/null; then
    sudo apt install p7zip-full -y
  fi
  7za e $1
fi
echo "Descompress finish."
