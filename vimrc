" ========================================================
" Essential Configurations
" ========================================================
filetype indent on                  " load filetype-specific indent files
syntax enable                       " enable syntax highlighting
set wildmenu                        " visual autocomplete for command menu
set showmatch                       " highlight matching !!important!!
set showcmd                         " show command in bottom bar
"syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap  "  Testing**
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
set pastetoggle=<F2>


" ========================================================
"   plugins
" ========================================================
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
Plug 'preservim/tagbar'

""  code completition 
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'   " python only
"Plug 'ycm-core/YouCompleteMe'
"Plug 'jpalardy/vim-slime'
Plug 'dense-analysis/ale'


" new colorschemes
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()


" ========================================================
"   Plugin Configs. 
" ========================================================

" 	colorscheme
set background=dark
colorscheme nord


""   	leader key remap
let mapleader= " "

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

" 	fzf/fzf.preview remaps  (see github repo for more examples)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" 	^pretty previwer with bat
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

"	ripgrep remaps
nnoremap <C-s> :Rg<Cr>                      " remaps `:Rg` (ripgrep fzf search) to `CTRL s` (think control search)
nnoremap <silent><leader>l :Buffers<CR>     " fzf search all open buffers 
""  	ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
let g:rg_highlight='true'


"   tagbar
nmap <leader>b :TagbarToggle<CR>

" ========================================================
"	**** MODERN VIM TEST/PRACTICE ****
" ========================================================

" tip 12: Linting w/ Ale 
"let g: ale_linters = {
"\   'bash',['shellcheck'],
"\   'javascript': ['eslint'],
"\   'json',['prettier'],
"\   'python',['flake8'],
"\   'r',['lintr'],
"\   'sql',['sqlfluff'],
"\   'vim',['vint']
"\}








" ========================================================
"	TESTING/DEFFERRING/ETC. (my personal attemps)
" ========================================================

"syntax on

"	ALE 
"let b:ale_completion_autoimport = 0
"let b:ale_linters = {
"\   'python': ['flake8'],
"\   'bash': ['shellcheck'],
"\   'r': ['lintr'],
"\}
"let b:ale_linters_explicit = 1

"	ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"let g:UltiSnipsEditSplit="vertical"

set rnu     

"   python execution
autocmd FileType python map <buffer> <F3> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ========================================================
" @TODO
" ========================================================

" YOUCOMPLETEME CONFIGS
""let g:ycm_python_interpreter_path = ''
""let g:ycm_python_sys_path = []
""let g:ycm_extra_conf_vim_data = [
""  \  'g:ycm_python_interpreter_path',
""  \  'g:ycm_python_sys_path'
""  \]
""let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
"
"" ========================================================
""   VIM-SLIME 
"" ========================================================
"let g:slime_target = \"tmux"                       ****REMOVE `\` when uncommenting 
"let g:slime_paste_file = \"$HOME/.slime_paste"     ****REMOVE `\` when uncommenting 

"let g:slime_cell_delimiter = \"```"                ****REMOVE `\` when uncommenting 
"nmap <leader>sl <Plug>SlimeLineSend
"nmap <leader>sc <Plug>SlimeSendCell
"nmap <leader>sp <Plug>SlimeParagraphSend                                                             xmap <leader>sr <Plug>SlimeRegionSend
"nmap <leader>sf <Plug>SlimeConfig

"" changing slime key mappings 
