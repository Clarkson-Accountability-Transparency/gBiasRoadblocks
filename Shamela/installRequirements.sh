#!/bin/bash

set -e # exit if an error occurs.

printf "## Installing System & Packages Requirements:\n"

case $(uname | tr '[:upper:]' '[:lower:]') in
  linux*)
    export OS_NAME=linux
    ;;
  darwin*)
    export OS_NAME=osx
    ;;
esac

if [[ $OS_NAME == 'linux' ]]; then
  printf "   # Installing System Requirements:\n"
  cat requirements.system | xargs sudo apt -qq install -y
  printf "   # Installing Packages Requirements:\n"
  yes | pip3 install -r requirements.pip --quiet

elif [[ $OS_NAME == 'osx' ]]; then
  printf "   # Installing System Requirements:\n"
  cat requirements.system | xargs brew install
  printf "   # Installing Packages Requirements:\n"
  yes | pip3 install -r requirements.pip --quiet

else
  printf "     ⚠ Sorry, You Need to Install Requirements Manually :( \n"

fi

printf "## Installing System & Packages Requirements is Done. \n\n"
