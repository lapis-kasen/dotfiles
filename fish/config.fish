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
alias ls="eza --icons"
alias ll="eza --icons -l"
alias ll="eza --icons -la"
alias lt="eza --icons --tree"
alias vi="nvim"
alias c="clear"
alias bat="bat --theme Nord"

# diff-so-fancy for git
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global is-interactive.diffFilter "diff-so-fancy --patch"

# EDITOR
set -x EDITOR "nvim"

fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin

if status --is-interactive
  mise activate fish | source
  mise exec zoxide --command "zoxide init fish" | source
  mise exec starship --command "starship init fish" | source
  mise exec cargo:pay-respects --command "pay-respects fish --alias" | source
end

# rye comp
eval "$(rye self completion -s fish)"
