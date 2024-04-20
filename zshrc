# SET PATH
PATH="$PATH:$HOME/.local/plugins:$HOME/.local/.bin:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.local/config"
PATH="$PATH:$HOME/.local/config/zsh/plugins"
PATH="$PATH:$HOME/.local/share/navi/cheats/externl"
PATH="$PATH:$HOME/.local/share/navi/cheats/custom"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

## PURE theme
fpath+=($HOME/.zsh/pure)

## ------------------------------
##   Plugins
## ------------------------------

# zap outlet
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"
plug "wintermi/zsh-rust"
plug 'marlonrichert/zsh-autocomplete'
plug 'Aloxaf/fzf-tab'

# vim key bindings for terminal w/ jk esc remap
plug 'jeffreytse/zsh-vi-mode'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk


# custom plugins
# source $HOME/.config/zsh/plugins/*


# ------------------------------------------------------------------------
##   PURE THEME w/ customizations
# ------------------------------------------------------------------------
fpath+=($HOME/.config/zsh/pure)
autoload -U promptinit; promptinit

zstyle :prompt:pure:user color '#81A1C1'
zstyle :prompt:pure:host color '#81A1C1'
zstyle :prompt:pure:path color '#81A1C1'
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:git:branch color '#D8BFD8'
zstyle :prompt:pure:git:action color '#B48EAD'
zstyle :prompt:pure:git:dirty color red #'#FFFACD'
zstyle :prompt:pure:git:arrow color green
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:stash color magenta

prompt pure

## Load and initialise completion system
autoload -Uz compinit

