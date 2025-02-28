#!/bin/bash
# mkdir
mkdir -p ~/.config/tmux
mkdir -p ~/.config/fish
# mkdir -p ~/.config/nvim/py3nvim
mkdir -p ~/.config/wezterm

CURRENT=$(cd $(dirname $0);pwd)

# set symbolic link tmux
ln -sf $CURRENT/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

# set symbolic link fish
ln -sf $CURRENT/fish/config.fish ~/.config/fish/config.fish

# set symbolic link nvim configuration
ln -sf $CURRENT/nvim ~/.config/nvim

# set symbolic link wezterm
ln -sf $CURRENT/wez/wezterm.lua ~/.config/wezterm/.wezterm.lua

# set symbolic link startship
ln -sf $CURRENT/starship/starship.toml ~/.config/starship.toml

# set symbolic link mise config
ln -sf $CURRENT/mise/config.toml ~/.config/mise/config.toml

read -n 1 -p "Is install python build tool?(y/n) > " IsInstall
echo ""
case "$IsInstall" in
  [Yy])
    printf "sudo password > "
    read -s password
    echo ""
    echo "$password" | sudo -S apt update
    echo "$password" | sudo -S apt install -y build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev xclip curl
    echo "$password" | sudo -S apt install -y tk-dev
    ;;
  [Nn])
    echo "skip python build tool install."
    ;;
esac

# tpm
if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# mise
echo "Install/Upgrade mise packages"

if [ ! -e ~/.local/bin/mise ]; then
  curl https://mise.run | sh
fi

# mise install
~/.local/bin/mise install
# mise upgrade
~/.local/bin/mise upgrade

# python3 for neovim
echo "Create venv for neovim"
cd ~/.config/nvim/py3nvim
~/.local/bin/mise exec --command "rye sync --force"

