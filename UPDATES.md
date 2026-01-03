# Vocabulary Plus - Updates

Vocabulary Plus is regularly updated. Below is a list of recent updates (v1.0.0 to v1.3.1).

## v1.0.0

Released: 29th November 2025

### All Python files

[main.py](main.py) and [create_vocab_file.py](create_vocab_file.py)

- Added coloured output with `colorama`

### Main

[main.py](main.py)

- Added waiting
- Added printing of Vocabulary Plus version as well as Python version

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- You can now run Vocabulary Plus with the `vocabularyplus` command in your terminal.  
Use `vocabularyplus create` to create a vocabulary file.
- Now deletes requirements.txt after installation

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.0.0)

## v1.0.1

Released: 30th November 2025

### Create Vocab File

[create_vocab_file.py](create_vocab_file.py)

- Made colours consistent
- Properly implemented `KeyboardInterrupt` handling
- System information print edited to align with Main

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- Added version print

#### Windows Installer

[install.bat](install.bat)

- Changed accidental use of 'color' to 'colour'

### Markdown Descriptions

[UPDATES.md](UPDATES.md) and [README.md](README.md)

- Renamed UPDATES.md to [updates.md](updates.md)
- Edited link to updates in [README](README.md)

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.0.1)

## v1.1.0

Released: 11th December 2025

### Main

[main.py](main.py)

- Added a summary of the questions answered which shows after Ctrl+C.

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- Added creation of a desktop app icon which runs the main app.  

  _Methods_

  - **Linux:** `.desktop` file
  - **macOS:** `.app` bundle
  - **Windows:** `.lnk` file
- Added creation of an uninstallation script. Run it with `vocabularyplus uninstall`

### README

[README.md](README.md)

- Edited running instructions
- Edited installation command for Unix
- Added instructions on uninstallation

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.1)

## v1.2.0

Released: 15th December 2025

### Terminal Commands

[install.sh](install.sh) and [install.bat](install.bat)

- Added flags
  - `--help`
  - `--version`
- Added subcommand `uninstall`

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- Added download of [README](README.md)

### Other

[CONTRIBUTING.md](CONTRIBUTING.md)

- Added [contribution instructions](CONTRIBUTING.md).

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/1.2.0)

## v1.2.1

Released: 15th December 2025

### Uninstallation Script

[install.sh](install.sh) and [install.bat](install.bat)

- Fixed issue [#16](https://github.com/46Dimensions/VocabularyPlus/issues/16)

### Updates

[UPDATES.md](UPDATES.md)

- Patched some minor problems

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.2.1)

## v1.3.0 Beta

Released: 20th December 2025  
v1.3.0 Beta is no longer available to be viewed; the changes can only be seen as part of v1.3.0.

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- Updated headers  

  #### Old headers

  _Unix_

  ``` text
  ====================================
  Vocabulary Plus Unix Installer 1.2.1
  ====================================
  ```

  _Windows_

  ``` text
  =======================================
  Vocabulary Plus Windows Installer 1.2.1
  =======================================
  ```

  #### New headers

  _macOS/Linux_

  ``` text
  ============================================
  Vocabulary Plus: Unix Installer (1.3.0 Beta)
  ============================================
  ```

  _Windows_

  ``` text
  ===============================================
  Vocabulary Plus: Windows Installer (1.3.0 Beta)
  ===============================================
  ```

- Updated colours
  - Headers are now bold high-intensity cyan.
  - All other colours are high-intensity as well

#### macOS/Linux Installer

[install.sh](install.sh)

- Added integration of [Vocabulary Plus Version Manager](https://github.com/46Dimensions/vp-vm) (`vp-vm`)
  - See [`vp-vm`'s README](https://github.com/46Dimensions/vp-vm/blob/main/README.md) for more information.
  - It will be available on Windows in 2026, in version 1.3.1.

### Version file

[VERSION.txt](VERSION.txt)

- Added a `version.txt` file for use in `vp-vm`

### App Icon

[app_icon.png](app_icon.png)

- Changed the icon for the desktop app to

[![The Vocabulary Plus logo](https://raw.githubusercontent.com/46Dimensions/VocabularyPlus/main/app_icon.png)](https://raw.githubusercontent.com/46Dimensions/VocabularyPlus/main/app_icon.png)

### Markdown

[README.md](README.md), [UPDATES.md](UPDATES.md),
[bug-report.md](.github/ISSUE_TEMPLATE/bug-report.md) and [CONTRIBUTING.md](CONTRIBUTING.md)

- Improved syntax to comply with [markdownlint](https://github.com/DavidAnson/markdownlint) rules
  - Added a `.markdownlint.json` file to configure markdownlint

#### README

[README.md](README.md)

- Added the [Vocabulary Plus logo](/readme_icon.png) to the top of [the file](/README.md)

## v1.3.0 (Stable)

Released: 1st January 2026  
This version contains all of the changes from v1.3.0 Beta and some more (below).

### Windows Installer

[install.bat](install.bat)

- Added integration with Vocabulary Plus Version Manager

### Markdown

[README.md](README.md) and [UPDATES.md](UPDATES.md)

#### Images

[readme_icon.png](readme_icon.png) and [app_icon.png](app_icon.png)

- Images are now accessed via the web.

#### Update notes

[UPDATES.md](UPDATES.md)

- Renamed from updates.md to UPDATES.md

#### README

[README.md](README.md)

- Now no longer downloaded in installation scripts

### Version file

[VERSION.txt](VERSION.txt)

- Renamed from version.txt to VERSION.txt

[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.3.0)

## v1.3.1

Released: 3rd January 2026

This version includes small bug fixes and enhancments.

### Installation Scripts

[install.sh](install.sh) and [install.bat](install.bat)

- Fixed branch name in base URL for downloads.
Previously, it used branch `1.3.0`, which, after deletion, did not work, so it has been updated to `main`.
- Fixed header formatting.
The `===` above and below the title were too long,
because they had not been shortened when the version was changed from '1.3.0 Beta' to '1.3.0'.

### Markdown

[UPDATES.md](UPDATES.md), [bug-report.md](.github/ISSUE_TEMPLATE/bug-report.md) and [CONTRIBUTING.md](CONTRIBUTING.md)

#### Update Notes

[UPDATES.md](UPDATES.md)

- Removed _View on GitHub_ link from v1.3.0 Beta and added it to v1.3.0
- Added note about v1.3.0 Beta being deleted
- Added links to files underneath headings

#### Contribution Instructions

[CONTRIBUTING.md](CONTRIBUTING.md)

- Improved formatting and reduced line length to under 100 characters
- Fixed branch name in link to bug report issue template

#### Bug Report Issue Template

[bug-report.md](.github/ISSUE_TEMPLATE/bug-report.md)

- Improved formatting
- Moved Details section to a `<details>` HTML tag
  - Edited markdownlint configuration to allow the `<details>` tag
  
[_View on GitHub_](https://github.com/46Dimensions/VocabularyPlus/releases/v1.3.1)
