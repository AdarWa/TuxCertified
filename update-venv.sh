#!/bin/bash

# Will not work in windows - obviously
# This script now works with colors!

function color() {
  if [ "$#" -ne 2 ] ; then
    echo "[ERROR] color <color-name> <text> expected two arguments, but got $#" >&2
    return 1
  fi

  local -r colorName="$1"
  local -r message="$2"
  
  local colorCode="0;37"
  case "${colorName,,}" in
    black          ) colorCode='0;30' ;;
    red            ) colorCode='0;31' ;;
    green          ) colorCode='0;32' ;;
    yellow         ) colorCode='0;33' ;;
    blue           ) colorCode='0;34' ;;
    magenta        ) colorCode='0;35' ;;
    cyan           ) colorCode='0;36' ;;
    white          ) colorCode='0;37' ;;
    bright_black   ) colorCode='0;90' ;;
    bright_red     ) colorCode='0;91' ;;
    bright_green   ) colorCode='0;92' ;;
    bright_yellow  ) colorCode='0;93' ;;
    bright_blue    ) colorCode='0;94' ;;
    bright_magenta ) colorCode='0;95' ;;
    bright_cyan    ) colorCode='0;96' ;;
    bright_white   ) colorCode='0;97' ;;
    gray           ) colorCode='0;90' ;;
    *              ) colorCode='0;37' ;;
  esac
 
  echo -e "\e[${colorCode}m${message}\e[0m"
}

if [ -d "./app" ]; then
    cd ./app
    color yellow "Moved into ./app directory."
else
    color green "Already in root folder."
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
REQUIRED_VERSION="3.10.0"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    color red "Python 3.10 or higher is required. Found version $PYTHON_VERSION."
    exit 1
fi

if [ -d ".venv" ]; then
    color green "Virtual environment already exists."
else
    color yellow "Creating virtual environment..."
    python3 -m venv .venv
    color green "Virtual environment created."
fi

source ./.venv/bin/activate
color yellow "Installing requirements..."
curl -sSL https://bootstrap.pypa.io/get-pip.py | python3
pip install --upgrade pip
pip install -r ../requirements.txt
color gray "Requirements installed."

color bright_green "[★] Virtual environment setup complete, this is generally only needed for the linter to work."
color bright_green "[★] It is recommended to use docker for running this application."