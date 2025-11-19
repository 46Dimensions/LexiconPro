#!/usr/bin/env sh
set -e
echo "=== VocabPy Installer ==="

BASE_URL="https://raw.githubusercontent.com/46Dimensions/VocabPy/main"
REQ_URL="$BASE_URL/requirements.txt"
MAIN_URL="$BASE_URL/main.py"
CREATE_URL="$BASE_URL/create_vocab_file.py"

check_python() {
    command -v python3 >/dev/null 2>&1 || { echo "Python3 missing"; exit 1; }

    PYVER=$(python3 --version 2>&1 | awk '{print $2}')
    MAJOR=$(echo "$PYVER" | cut -d. -f1)
    MINOR=$(echo "$PYVER" | cut -d. -f2)

    if [ "$MAJOR" -lt 3 ] || { [ "$MAJOR" -eq 3 ] && [ "$MINOR" -lt 10 ]; }; then
        echo "Need Python >= 3.10 (found $PYVER)"
        exit 1
    fi
}

check_python

echo "Creating VocabPy directory..."
mkdir -p VocabPy

echo "Downloading files..."
curl -fsSL "$REQ_URL" -o VocabPy/requirements.txt || { echo "Failed to download requirements.txt"; exit 1; }
curl -fsSL "$MAIN_URL" -o VocabPy/main.py || { echo "Failed to download main.py"; exit 1; }
curl -fsSL "$CREATE_URL" -o VocabPy/create_vocab_file.py || { echo "Failed to download create_vocab_file.py"; exit 1; }

echo "Creating virtual environment..."
python3 -m venv VocabPy/venv
[ -d "VocabPy/venv" ] || { echo "Virtual environment creation failed"; exit 1; }

if [ -f "VocabPy/venv/bin/python3" ]; then
    PY="VocabPy/venv/bin/python3"
else
    PY="VocabPy/venv/Scripts/python.exe"
fi

echo "Upgrading pip..."
"$PY" -m pip install --upgrade pip

echo "Installing dependencies..."
"$PY" -m pip install -r VocabPy/requirements.txt

echo
echo "=== Installation complete! Launching VocabPy... ==="
echo

"$PY" VocabPy/main.py || { echo "Failed to launch VocabPy"; exit 1; }

echo
echo "Done!"
echo "To run VocabPy again later:"
echo "  source VocabPy/venv/bin/activate && python VocabPy/main.py"
