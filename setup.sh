#!/bin/bash
# mkdir
mkdir -p ~/.config/tmux
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
mkdir -p ~/.config/wezterm

CURRENT=$(cd $(dirname $0);pwd)

# set symbolic link tmux
ln -sf $CURRENT/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

# set symbolic link fish
ln -sf $CURRENT/fish/config.fish ~/.config/fish/config.fish

# set symbolic link nvim configuration
ln -sf $CURRENT/nvim/init.lua ~/.config/nvim/init.lua
ln -sf $CURRENT/nvim/lua ~/.config/nvim/

ln -sf $CURRENT/nvim/luarc.json ~/.config/nvim/.luarc.json
ln -sf $CURRENT/nvim/luarc.json ~/.config/nvim/lua/.luarc.json
ln -sf $CURRENT/nvim/luarc.json ~/.config/nvim/lua/plugins/.luarc.json

# set symbolic link wezterm
ln -sf $CURRENT/wez/wezterm.lua ~/.config/wezterm/.wezterm.lua

# set symbolic link startship
ln -sf $CURRENT/starship/starship.toml ~/.config/starship.toml

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

# rtx
# if [ ! -e ~/bin/rtx ]; then
#   curl https://rtx.pub/rtx-latest-linux-x64 > ~/bin/rtx
#   chmod +x ~/bin/rtx
#   echo 'eval "$(~/bin/rtx activate bash)"' >> ~/.bashrc
#   source ~/.bashrc
# fi

# rtx packages 
# rtx_packages=('golang' 'python' 'rust' 'nodejs' 'neovim' 'peco' 'ghq' 'fd' 'fzf' 'repgrep' 'bat' 'starship' 'exa')
# for lc in "${rtx_packages[@]}"
# do
# 	rtx install ${rp}
#   rtx use --global ${rp}
# done
# starship
# echo 'eval "$(starship init bash)"' >> ~/.bashrc
# nvim
# pip3 install neovim
# npm install -g neovim
# npm install -g yarn
# python 
# pip3 install pipx
# pipx insatll black
# pipx install poetry
# rtx current
