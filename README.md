# dotfiles

My personal dotfiles for PopOS! Feel free to use anything you find useful.

## Setup

GNU Stow
[automates](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/) the
placement of symbolic links in the home directory.
[GNU Make](https://www.gnu.org/software/make/) manages the details. Read the
`Makefile` for more information.

```bash
# Install system dependencies if not already installed
sudo apt install build-essential git stow
# Install libraries if not already installed
make install
# Place the dotfiles
make dotfiles
```

## Author

Zacharias Lenz _zacharias.lenz@pm.me_
