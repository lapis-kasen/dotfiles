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

# diff-so-fancy for git
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global is-interactive.diffFilter "diff-so-fancy --patch"

# EDITOR
set -x EDITOR "nvim"

if status --is-interactive
  mise exec zoxide --command "zoxide init fish" | source
  mise exec starship --command "starship init fish" | source
end

# mise completion
# if "usage" is not installed show an error
if ! command -v usage &> /dev/null
    echo >&2
    echo "Error: usage CLI not found. This is required for completions to work in mise." >&2
    echo "See https://usage.jdx.dev for more information." >&2
    return 1
end
set _usage_spec_mise (mise usage | string collect)
complete -xc mise -a '(usage complete-word --shell fish -s "$_usage_spec_mise" -- (commandline -cop) (commandline -t))'

# rye comp
eval "$(rye self completion -s fish)"
