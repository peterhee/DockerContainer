curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo chmod +x install_nvm.sh
sudo ./install_mvm.sh
source ~/.profile
nvm install 8.10.0
nvm alias default 8.10.0
nvm use default
node -v