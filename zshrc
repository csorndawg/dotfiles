
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
path+=('/home/csorndog/.local/bin')
path+=('/home/csorndog/.fzf')
path+=('/home/csorndog/.local/share')
path+=('/home/csorndog/.config/')
path+=('/home/csorndog/.local/scripts')
path+=('/home/csorndog/cc-bible/tools')

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="pure"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    colorize 
    command-not-found 
    copyfile
    copybuffer
    git
    gitignore 
    python 
    zsh-vi-mode
    rand-quote
    ripgrep
    thefuck
    tmux 
    ubuntu
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    fd
    history-substring-search
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
# else
#   export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ===========================================
#   ZSHRC HOUSEKEEPING/BASIC CONFIGURATIONS
# ===========================================

## PURE THEME
fpath+=($HOME/.zsh/pure)               

fpath+=($HOME/.oh-my-zsh/custom/themes/pure)       ## TRIED TESTING BUT REVERTING BACK
autoload -U promptinit; promptinit
#prompt pure    ## need to move below all prompt customization configurations
zstyle :prompt:pure:path color 045 #075 #117
zstyle :prompt:pure:host color 067 #103 #189
zstyle :prompt:pure:user color 067 #110
zstyle :prompt:pure:user:root color 115 #110
zstyle :prompt:pure:continuation color 147
zstyle :prompt:pure:virtualenv color 193
zstyle :prompt:pure:git:branch color 036
PURE_PROMPT_VICMD_SYMBOL='λ'
prompt pure ## calling prompt with above customizations

# rust 
#fpath+=~/.zfuncfpath+=~/.zfuncfpath+=~/.zfunc
#rustup completions zsh > ~/.zfunc/_rustup

# set VIM default editor all cases 
export VISUAL=vim
export EDITOR=vim

## git aliases
alias gs="git status"
alias gcm="git checkout master"
alias gpl="git pull"
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git checkout $1"
alias gcb="git checkout -b $1"
alias gcom="git commit -m $1"
alias gp="git push -u origin $1"
alias p=python3
alias python=python3
alias jc="jupyter console"


# ===========================================
#   ZSH CUSTOM FUNCTIONS
# ===========================================




# ===========================================
#   ZSH CUSTOM ENV. 
# ===========================================

# ----------------------
## vi-mode Aliases
# ----------------------

# use vi mode
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
# vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1


# copied from article -- need to test
# indicators 
## ## Init
#setopt PROMPT_SUBST
#
### Options
#THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
#THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ'}
#THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ'}
#
### Set symbol for the initial mode
#THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
#
## on keymap change, define the mode and redraw prompt
#zle-keymap-select() {
#  if [ "${KEYMAP}" = 'vicmd' ]; then
#    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
#  else
#    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
#  fi
#  zle reset-prompt
#}
#zle -N zle-keymap-select
#
## reset to default mode at the end of line input reading
#zle-line-finish() {
#  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
#}
#zle -N zle-line-finish
#
## Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
## while in fact you would be in INS mode.
## Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
## so if anything else depends on it, we will not break it.
#TRAPINT() {
#  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
#  return $(( 128 + $1 ))
#}
#


# ===========================================
#   MODERN UNIX/OPEN SOURCED TOOLS CONFIGS
# ===========================================

## needed for ripgrep custom configurations
RIPGREP_CONFIG_PATH="$(ls $HOME/.ripgreprc)"

## ==========================================
#       FZF: Bindings, Scripts, etc.
## ==========================================


alias r=R

## ====================================================================================
#       Workflow/Productivity/Etc.
## ====================================================================================

# git convenience
alias gs="git status"
alias gcm="git checkout master"
alias gp="git pull"
alias gpsh="git push"
alias gct="git checkout"

#TODO: *TRIAL/TEST below and remove if not helpful
alias gcmt="git commit"
alias gcmtv="git commit -m"         ## verbose commit
alias grb="git rebase"
alias grbi="git rebase -i"
alias gplfrc="git pull --force"     ## USE AFTER REBASE COMPLETED

## suffix aliases 
alias -s md=vim     ## opens markdown (.md) in vim if entered by itself on CLI
alias -s py=vim
alias -s txt=bat
alias -s hlp=bat

# ===========================================
#   ZSHRC LOAD/INTIALIZATION SCRIPTS
# ===========================================

# automatically load default VENV 
#source /home/csorndog/utils/codeEnvs/python/venv/bin/activate

# auto request/fetch Kanye quote after terminal loads. Add quote to running list file after displaying
#curl https://api.kanye.rest/ | jq | tee -a  /home/csorndog/quick/daily/quotes/refs/kanye_quotes.running_list.md

# ===========================================
##   SHELL QUICK ADDS
# ===========================================

# ez = edit zshrc
alias ez="vim /home/csorndog/.zshrc"
#alias chts="/home/csorndog/.config/cheat/cheatsheets/"
alias chts="/home/csorndog/.config/cheat/cheatsheets/"
alias chts_temp="/home/csorndog/.config/cheat/cheatsheets/temp.cht"
alias chts_temp_wr="vim /home/csorndog/.config/cheat/cheatsheets/temp.cht/$*"

## miniconda for R/Python data analysis
export PATH='/home/csorndog/bin:/usr/local/bin:/home/csorndog/utils/codeEnvs/python/venv/bin:/home/csorndog/bin:/usr/local/bin:/home/csorndog/utils/codeEnvs/python/venv/bin:/home/csorndog/bin:/usr/local/bin:/home/csorndog/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/csorndog/.local/bin:/home/csorndog/.local/share:/home/csorndog/.config/:/home/csorndog/.local/scripts:/home/csorndog/cc-bible/tools:/home/csorndog/.local/bin:/home/csorndog/.local/share:/home/csorndog/.config/:/home/csorndog/.local/scripts:/home/csorndog/cc-bible/tools:/home/csorndog/.local/bin:/home/csorndog/.local/share:/home/csorndog/.config/:/home/csorndog/.local/scripts:/home/csorndog/cc-bible/tools/://home/csorndog/.local/miniconda3/bin'


#===============================================================================
#===============================================================================
##  [[ IDEA/TEST ZSHRC ]]


alias repo-bookmarks="vim starred-repos.bookmarked_repos.running_list.md"
alias learning-bookmarks="vim /home/csorndog/myNotes.Dec/starred-repos/starred-repos.bookmarked_repos.running_list.md"
alias web-bookmarks="vim ~/myNotes.Dec/bkmks/web/onetab_exports.2023_01_07.txt"
alias quicknote_add="vim /home/csorndog/myNotes.Dec/unsorted/quicknote_default.md"
alias zc_go="cd /home/csorndog/quick/quicknotes/personal_nonTech"


#===============================================================================
##   VIMRC BUFFER ISSUE TEMP.FIX   @TODO:  Fix later
#===============================================================================

#alias vim="vim -S /home/csorndog/.vimrc"
#alias vim="vim -c 'set buftype='"       ## @TESTING

#===============================================================================
alias jn='jupyter notebook --no-browser | tee -a /home/csorndog/data/logs/jupyter/jupyter_nb_remote_server.log'

#===============================================================================
#   TESTING/UNSTABLE
#===============================================================================


## MARCH ADDITIONS
alias cookiecutter-datascience="cookiecutter https://github.com/drivendata/cookiecutter-data-science"

#### TERM. ENV INIT LOADS
# automatically load default VENV 
#source /home/csorndog/utils/codeEnvs/python/venv/bin/activate
source /home/csorndog/.local/etc/venvs/venv/bin/activate 
alias cb="cd /dat/cookbooks"
alias ssh_github_csorndawg_pp="cat ~/.vault/logins/csorndog_github_ssh_logins.txt"

# TODO: move below to bash script. After update code to simply call/execute
#       bash script instead of using aliases (aliases not optimal soln. for this case)
# auto request/fetch Kanye quote after terminal loads. Add quote to running list file after displaying
echo ""
#curl -s  https://api.kanye.rest/ | jq | tee -a  /home/csorndog/quick/daily/quotes/refs/kanye_quotes.running_list.md
curl -s  https://api.kanye.rest/ 

################################################################################
#   FZF/ZVIM KEYBINDS, SOURCING, IDEAS, ETC.
################################################################################

#####   NOTE: ZVM docs state to move/resource FZF keybinds to below loc in .zshrc
#  FROM ZVM DOC: SOURCE  FZF.ZSH which sources completion 
#  keybind script in ~/.fzf/shell/completion.zsh

##  -----------------------------------
##  FZF KEY BINDINGS REMAPS
##  -----------------------------------


# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## MAY  ADDITIONS
alias weatherr="curl wttr.in/New+York"
