# Update
sudo apt update
sudo apt upgrade -y

# Add repositories
sudo add-apt-repository -y ppa:linuxuprising/java
sudo add-apt-repository -y ppa:sebastian-stenzel/cryptomator
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
sudo apt update

# Install libraries
sudo apt install -y \
    autoconf \
    automake \
    cmake \
    curl \
    default-jre \
    gcc \
    gfortran \
    libasound2-dev \
    libbz2-dev \
    libdbus-1-dev \
    libjansson-dev \
    libpulse-dev \
    libseccomp-dev \
    libsecret-tools \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libyaml-dev \
    libncurses5-dev \
    llvm \
    lsb \
    pkg-config \
    python3-docutils \
    python3-pip \
    python3-venv \
    wget \
    zlib1g-dev

# Install applications
sudo apt install -y \
    cryptomator \
    fd-find \
    jq \
    syncthing \
    tree \
    xclip \
    xdotool \
    zathura \
    zip \
    zsh

ln -s $(which fdfind) ~/.local/bin/fd
