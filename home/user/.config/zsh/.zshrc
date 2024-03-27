# .zshrc by TheK4n
# https://github.com/TheK4n/dotfiles

if command -v tmux &>/dev/null && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

if [ -f "$ZDOTDIR/sourcer" ]; then
    source "$ZDOTDIR/sourcer"
fi