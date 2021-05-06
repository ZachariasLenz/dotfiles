# Install nvm and latest node/npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

# Install global packages
npm i -g vtop
npm i -g prettier @prettier/plugin-xml
npm i -g prettier-plugin-sh
npm i -g prettier-plugin-toml --save-dev --save-exact
