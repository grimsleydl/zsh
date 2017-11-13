export PATH="$HOME/.local/bin/:$PATH"

setopt no_hist_verify

export GREP_COLOR='1;33'
# unset GREP_OPTIONS


# https://github.com/junegunn/fzf/wiki/examples
# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
    local selected
    if selected=$(locate / | fzf -q "$LBUFFER"); then
        LBUFFER=$selected
    fi
    zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget
