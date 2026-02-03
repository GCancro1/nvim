sudo apt update
sudo apt install -y bat ripgrep  

# Create a symlink so `bat` works
sudo ln -sf /usr/bin/batcat /usr/bin/bat

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
