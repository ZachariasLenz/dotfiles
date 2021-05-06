# Install Nix package manager
curl -L https://nixos.org/nix/install | sh
. $HOME/.nix-profile/etc/profile.d/nix.sh

# Install neuron
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix use srid
nix-env -if https://github.com/srid/neuron/archive/master.tar.gz

# install spotify-tui
nix-env -iA nixpkgs.spotify-tui

# Install utilities
nix-env --install bat
nix-env --install ripgrep
