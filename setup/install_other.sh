# Make directory to download install files
DIR=$HOME/.terminal
mkdir $DIR
mkdir $HOME/.local/bin

#####################
# Terminal Emulator #
#####################

# Install Kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
ln -s $HOME/.local/kitty.app/bin/kitty $HOME/.local/bin/
cp $HOME/.local/kitty.app/share/applications/kitty.desktop $HOME/.local/share/applications
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" $HOME/.local/share/applications/kitty.desktop

####################
# Fonts and Themes #
####################

# Install Cascadia Code, and Victor Mono fonts patched for Nerd Fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts $DIR/nerd-fonts
cd $DIR/nerd-fonts
sh -c ./install.sh CascadiaCode
sh -c ./install.sh VictorMono
fc-cache -f -v

# Install Nord color scheme
git clone https://github.com/arcticicestudio/nord-dircolors.git $DIR/nord-dircolors
cd $DIR/nord-dircolors
sh -c ./install.sh

# Install powerlevel10k
sudo sh -c 'echo "set bell-style none" >> /etc/inputrc'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.powerlevel10k

#######
# Lua #
#######

# Install Lua
cd $DIR
curl -R -O http://www.lua.org/ftp/lua-5.4.3.tar.gz
tar -zxf lua-5.4.3.tar.gz
cd lua-5.4.3
make linux test
sudo make install

# Install LuaRocks
cd $DIR
wget https://luarocks.org/releases/luarocks-3.7.0.tar.gz
tar zxpf luarocks-3.7.0.tar.gz
cd luarocks-3.7.0
./configure && make && sudo make install
sudo luarocks install luasocket
cd $DIR

##########
# Python #
##########

# Install pyenv
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Install poetry
mkdir ~/.zfunc
pip3 install --user --upgrade keyrings.alt
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python3
export PATH=$HOME/.poetry/bin:$PATH
poetry config virtualenvs.in-project true

##########
# Neovim #
##########

# Post install setup for neovim: make virtuenv, install python package and ctags
pip3 install --user neovim-remote
pyenv install 3.9.1
pyenv virtualenv 3.9.1 neovim
pyenv activate neovim
pip install neovim neovim-remote
pyenv deactivate
git clone https://github.com/universal-ctags/ctags.git $DIR/ctags
cd $DIR/ctags
sh -c ./autogen.sh
sh -c ./configure
make
sudo make install

#########
# Utils #
#########

# Install zsh plugins
mkdir $HOME/.zshplugins
git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.zshplugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zshplugins/zsh-autosuggestions
git clone https://github.com/darvid/zsh-poetry $HOME/.zshplugins/zsh-poetry
