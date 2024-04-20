# SET PATH
PATH="$PATH:$HOME/.local/plugins:$HOME/.local/.bin:$HOME/.cargo/bin:$HOME/.local/config/zsh/plugins"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

## ------------------------------
##   Plugins
## ------------------------------

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#81A1C1"

# TODO
# TAB COMPLETE ON SUGGESTION
ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=(menu-expand-or-complete)
bindkey '^I' autosuggest-execute

# TODO: reduce visual noise w/ colors and theme and fzf-tab
plug "zsh-users/zsh-syntax-highlighting"
plug 'marlonrichert/zsh-autocomplete'
plug 'agkozak/zsh-z' 

# vim key bindings for terminal w/ jk esc remap
plug 'jeffreytse/zsh-vi-mode'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# custom plugins
source $HOME/.config/zsh/plugins/*

# ------------------------------------------------------------------------
##   PURE THEME w/ customizations
# ------------------------------------------------------------------------
fpath+=($HOME/.config/zsh/pure)
autoload -U promptinit; promptinit

zstyle :prompt:pure:user color '#5E81AC'
zstyle :prompt:pure:host color '#5E81AC'
zstyle :prompt:pure:path color '#A3BE8C'
zstyle :prompt:pure:prompt:success color '#8FBCBB' #cyan
zstyle :prompt:pure:git:branch color '#EBCB8B'
zstyle :prompt:pure:git:action color '#EBCB8B'
zstyle :prompt:pure:git:dirty color '#EBCB8B'
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:stash color '#EBCB8B'

prompt pure
