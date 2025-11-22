# LexiconPro - Updates
LexiconPro is regularly updated. Below is a list of recent updates.

## v1.1.0
Released: 19th November 2025

### Markdown Descriptions
- Updated `README.md`
- Added this `UPDATES.md`

### Main.py
#### Fixed some potential bugs when running on Windows:
- Added a fallback if the terminal does not support ANSI cursor movement
- Added output flush in `dynamic_input()` to prevent issues displaying text with `\r`.
- `file_path = Path(full_path).expanduser().resolve()` in `get_display_filename` edited to prevent a problem on Windows when using a network drive of symlink that the user lacks permission for.

#### UI changes:
- Now prints Python version and system information at start
- Moved the `Use CTRL+C to quit` message to just after printing the version info
- Added an underline beneath the VocabPy title lines

### Create Vocab File.py
#### Fixed Windows compatibility issues:
- Fixed an issue where the vocabulary file is not saved properly
- Simplified `.json` extension check to work with uppercase file extensions on Windows
- Added Windows reserved filename check
#### Other changes
- Made input stripping consistent in `check_input`

### Installation Scripts
- Added creation of a 'VocabPy' directory inside the working directory
- Added download of `create_vocab_file.py`
- Added Python check - aborts if Python is not installed or is below version 3.10.
- Now runs the script from inside the virtual environment

## v1.1.1
Released: 22nd November 2025

### Main.py
- Edited print when there are no JSON files found for clarity
- Now exits with code 0 instead of 1 when the above happens

### Installation Scripts
- Added colour output
#### Specific changes for Windows installer
- Made the errorlevel check safer
- Made all paths consistent
- Runs `main.py` without activating Virtual Environment first (activation is unnecessary)
#### Specific changes for Unix installer
- Now runs `cd VocabPy` after creating it to make sure everything is in that directory

## LexiconPro - v1.1.2
Released: 22nd November 2025
### Repository
- Renamed to 46Dimensions/LexiconPro
### Create Vocab File.py
- Added carriage return for word/meaning input
- Added 0.5-second wait between asking for word/meaning input and clearing lines
- Improved documentation
### Main.py
- Removed unnecessary `Any` import from `typing`
- Added exit with code 1 (error) after an exception in `main()`
### All files
- Changed all instances of `VocabPy` (except some in this file) to `LexiconPro`