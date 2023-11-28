# load rtx
set rtx (which rtx)
$rtx activate fish | source
rtx hook-env -s fish | source
rtx complete -s fish | source

# path config
set -x PATH $PATH $GOPATH/bin

# install fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugin
fundle plugin "edc/bass"
fundle plugin "fisherman/spin"
fundle plugin "jethrokuan/fzf"
fundle plugin "decors/fish-ghq"
fundle plugin "oh-my-fish/plugin-peco"

# fundle init
fundle init

# alias
alias ls="exa --icons"
alias ll="exa --icons -l"
alias ll="exa --icons -la"
alias lt="exa --icons --tree"
alias vi="nvim"
alias c="clear"
alias bat="bat --theme Nord"

# color
set -g TERM screen-256color

# zoxide from rtx
zoxide init fish | source

# thef*ck
thefuck --alias | source

# starship (must be final line)
starship init fish | source
