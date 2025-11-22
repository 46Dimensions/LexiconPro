#!/usr/bin/env sh
set -e

# ANSI colours
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
reset="\033[0m"

echo "${green}===========================${reset}"
echo "${green}   VocabPy Unix Installer  ${reset}"
echo "${green}===========================${reset}"
echo

BASE_URL="https://raw.githubusercontent.com/46Dimensions/VocabPy/main"
REQ_URL="$BASE_URL/requirements.txt"
MAIN_URL="$BASE_URL/main.py"
CREATE_URL="$BASE_URL/create_vocab_file.py"

check_python() {
    command -v python3 >/dev/null 2>&1 || {
        echo "${red}ERROR: Python3 not found. Please install Python 3.10+.${reset}";
        exit 1;
    }

    PYVER=$(python3 --version 2>&1 | awk '{print $2}')
    MAJOR=$(printf "%s" "$PYVER" | cut -d. -f1)
    MINOR=$(printf "%s" "$PYVER" | cut -d. -f2)

    if [ "$MAJOR" -lt 3 ] || { [ "$MAJOR" -eq 3 ] && [ "$MINOR" -lt 10 ]; }; then
        echo "${red}ERROR: Python must be >= 3.10 (found $PYVER).${reset}"
        exit 1
    fi
}

check_python

echo "${yellow}Creating VocabPy directory...${reset}"
mkdir -p VocabPy

echo "${yellow}Downloading files...${reset}"
curl -fsSL "$REQ_URL" -o VocabPy/requirements.txt || { echo "${red}Failed to download requirements.txt${reset}"; exit 1; }
curl -fsSL "$MAIN_URL" -o VocabPy/main.py || { echo "${red}Failed to download main.py${reset}"; exit 1; }
curl -fsSL "$CREATE_URL" -o VocabPy/create_vocab_file.py || { echo "${red}Failed to download create_vocab_file.py${reset}"; exit 1; }

[ -f VocabPy/requirements.txt ] || { echo "${red}requirements.txt missing${reset}"; exit 1; }
[ -f VocabPy/main.py ] || { echo "${red}main.py missing${reset}"; exit 1; }
[ -f VocabPy/create_vocab_file.py ] || { echo "${red}create_vocab_file.py missing${reset}"; exit 1; }

echo "${yellow}Creating virtual environment...${reset}"
python3 -m venv VocabPy/venv || { echo "${red}Failed to create venv${reset}"; exit 1; }

if [ -f "VocabPy/venv/bin/python3" ]; then
    PY="VocabPy/venv/bin/python3"
else
    echo "${red}Could not find Python binary in venv${reset}"
    exit 1
fi

echo "${yellow}Upgrading pip...${reset}"
"$PY" -m pip install --upgrade pip || { echo "${red}Failed to upgrade pip${reset}"; exit 1; }

echo "${yellow}Installing dependencies...${reset}"
"$PY" -m pip install -r VocabPy/requirements.txt || { echo "${red}Failed to install dependencies${reset}"; exit 1; }

echo
echo "${green}===============================${reset}"
echo "${green}   Installation complete!${reset}"
echo "${green}   Launching VocabPy...${reset}"
echo "${green}===============================${reset}"
echo

"$PY" VocabPy/main.py || { echo "${red}Failed to launch VocabPy${reset}"; exit 1; }

echo
echo "Done!"
echo "To run VocabPy later:"
echo "  . VocabPy/venv/bin/activate && python3 VocabPy/main.py"