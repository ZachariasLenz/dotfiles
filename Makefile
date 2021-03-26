MKDIR_CONFIG = $(subst dotfiles, ~, $(dir $(wildcard dotfiles/.config/*)))

.PHONY: dotfiles
dotfiles:  # symlink dotfiles in home folder with stow
	@mkdir -p $(MKDIR_CONFIG)
	stow --target $(HOME) --restow $@
	$(shell systemctl --user start syncthing.service && systemctl --user enable syncthing.service)
install:  # run install scripts
	$(shell ./setup/install_apt.sh)
	$(shell ./setup/install_nix.sh)
	$(shell ./setup/install_npm.sh)
	$(shell ./setup/install_other.sh)
	$(shell ./setup/install_snap.sh)
