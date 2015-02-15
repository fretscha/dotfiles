#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

#git pull

#tar -cHvf dotfiles_$(date +"%Y-%d-%m.%H-%M-%S").tar --exclude .git -C ~ $(cat index.txt)

if [ $? -ne 0 ]; then
    echo "ERROR Backup failed! Terminating."
    exit 1
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  for i in $(cat index.txt); do
    rm -rf ~/$i
    ln -s $PWD/$i ~/$i
  done
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  for i in $(cat index.txt index_osx.txt); do
    rm -rf ~/$i
    ln -s $PWD/$i ~/$i
  done
fi

source ~/.bash_profile

