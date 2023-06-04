" ========================================================
" Essential Configurations
" ========================================================
" below might be fix for buftype issue I've been experiencing 
" set shell=bash, always

" remap leader to space ; alias "\" and "," to leader
let mapleader= " "
nmap <bslash> <space>
nmap , <space>

set  nocompatible
filetype indent on                  " load filetype-specific indent files
syntax enable                       " enable syntax highlighting
set wildmenu                        " visual autocomplete for command menu
set showmatch                       " highlight matching !!important!!
" set showcmd                         " show command in bottom bar
"syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set smartcase
set colorcolumn=80
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch   " highlight matches from ? and /
set wrapscan    " wrap search results
set splitbelow
set splitright
set encoding=utf-8
set clipboard=unnamed


" ========================================================
"   sensible vimrc 
" ========================================================
" Disable vi compatibility, if for some reason it's on.
if &compatible
  set nocompatible
endif

" Check if an option was set from a file in $HOME.  This lets us avoid
" overriding options in the user's vimrc, but still override options in the
" system vimrc.
function! s:MaySet(option) abort
  if exists('*execute')
    let out = execute('verbose setglobal all ' . a:option . '?')
  else
    redir => out
    silent verbose execute 'setglobal all' a:option . '?'
    redir END
  endif
  return out !~# " \\(\\~[\\/][^\n]*\\|Lua\\)$"
endfunction

if s:MaySet('backspace')
  set backspace=indent,eol,start
endif

set nrformats-=octal

" Make the escape key more responsive by decreasing the wait time for an
" escape sequence (e.g., arrow keys).
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

if has('reltime') && s:MaySet('incsearch')
  set incsearch
endif
" Use CTRL-L to clear the highlighting of 'hlsearch' (off by default) and call
" :diffupdate.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if s:MaySet('laststatus')
  set laststatus=2
endif
if s:MaySet('ruler')
  set ruler
endif
if s:MaySet('wildmenu')
  set wildmenu
  set wildignore+=*/tmp/*,*.so,*.zcignore,*.zip  " ignore specific files and directories
endif

if s:MaySet('scrolloff')
  set scrolloff=1
endif
if s:MaySet('sidescroll') && s:MaySet('sidescrolloff')
  set sidescroll=1
  set sidescrolloff=2
endif
set display+=lastline
if has('patch-7.4.2109')
  set display+=truncate
endif

if s:MaySet('listchars')
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Delete comment character when joining commented lines.
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Replace the check for a tags file in the parent directory of the current
" file with a check in every ancestor directory.
if has('path_extra') && (',' . &g:tags . ',') =~# ',\./tags,'
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if s:MaySet('autoread')
  set autoread
endif

if s:MaySet('history')
  set history=1500
endif
if s:MaySet('tabpagemax')
  set tabpagemax=50
endif

" Persist g:UPPERCASE variables, used by some plugins, in .viminfo.
if !empty(&viminfo)
  set viminfo^=!
endif
" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Disable a legacy behavior that can break plugin maps.
if has('langmap') && exists('+langremap') && &langremap && s:MaySet('langremap')
  set nolangremap
endif

if !(exists('g:did_load_filetypes') && exists('g:did_load_ftplugin') && exists('g:did_indent_on'))
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" From `:help :DiffOrig`.
if exists(":DiffOrig") != 2
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ 
              \ | diffthis | wincmd p | diffthis
endif

" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" required for vimwiki
set nocompatible
filetype plugin on
syntax on
" -------------------------------------------------------------------
" -------------------------------------------------------------------


" ========================================================
"   zc core remaps (non-plugin related)  ***NOTE: STILL BEING TESTED
" ========================================================


" -------------------------------------------------------------------
" -------------------------------------------------------------------


" ========================================================
"   plugins
" ========================================================
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
Plug 'preservim/tagbar'

""  code completition 
Plug 'davidhalter/jedi-vim'   " python only
Plug 'dense-analysis/ale'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'jpalardy/vim-slime'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" new colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'

" may trial plugins 
Plug 'preservim/vimux'
Plug 'chrisbra/matchit'
Plug 'vimwiki/vimwiki'

call plug#end()

" ========================================================
"   Plugin Configs. 
" ========================================================

" 	colorscheme
set background=dark
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
" backup colorscheme (auto configures airline) if above has issues
" colorscheme nord (backup)

" ========================================================
" 	TESTING: Plugin Related Remaps that NEED TESTING before being added 

" ========================================================

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" -----------------------------------------------------------------------
" -----------------------------------------------------------------------

""	**** Current PLUGIN related remaps ****

" 	window navigation remaps. (change to mirror tmux)
nnoremap <C-h> <C-w>h      
nnoremap <C-j> <C-w>j      
nnoremap <C-k> <C-w>k      
nnoremap <C-l> <C-w>l      

" 	primagen 
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <silent> <leader>gd :YouCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YouCompleter FixIt<CR>

" 	fugative remaps
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

""   ALE (VIA WEBDEV)

" don't check syntax immediately on open or on quit
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" move cursor to next erorr w/ Ctrl-e ; makes cycling thru errors easier
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" display number of errors/warnings in status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" error symbols
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" format error strings
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ---------------------------------------------------------------
"       IDEA.VIMRC
" ---------------------------------------------------------------

" ; changes mode from Normal/Visual to Command mode
nnoremap ; : 
vnoremap ; :
