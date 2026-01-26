
# Neovim (latest stable)
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update

sudo apt update
sudo apt install -y \
    curl git build-essential gcc unzip nodejs npm \
    ripgrep fd-find clang luarocks neovim

# Remove apt/npm conflicts
sudo npm uninstall -g tree-sitter-cli -y

# Install exact version
sudo npm install -g tree-sitter-cli@0.25.0

# Verify
tree-sitter --version  # v0.25.0 


# PATH for local installs
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

sudo chown -R $USER:$USER ~/.local/share/nvim/ ~/.local/state/nvim/

# Add to PATH (add this line to ~/.bashrc or ~/.zshrc)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
