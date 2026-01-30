
# Neovim (latest stable)
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update

sudo apt update
sudo apt install -y \
    curl git build-essential gcc unzip nodejs npm \
    ripgrep fd-find clang luarocks

sudo apt install python3-venv python3-dev build-essential
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


curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove any old version
sudo rm -rf /opt/nvim-linux-x86_64

# Extract it into /opt
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz


# Add Neovim to the PATH (temporary)
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Make it permanent
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.profile



source ~/.bashrc
