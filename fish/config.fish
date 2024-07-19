# load mise
~/.local/bin/mise activate fish | source

# path config
set -x PATH $PATH $GOPATH/bin

# install fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# fundle plugin
fundle plugin "edc/bass"
fundle plugin "fisherman/spin"
fundle plugin "PatrickF1/fzf.fish"
fundle plugin "decors/fish-ghq"
fundle plugin "oh-my-fish/plugin-peco"
fundle plugin "FabioAntunes/base16-fish-shell"

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

# fzf


# EDITOR
set -x EDITOR "nvim"

if status --is-interactive
  mise exec zoxide --command "zoxide init fish" | source
  mise exec starship --command "starship init fish" | source
end

# rye comp
eval "$(rye self completion -s fish)"
