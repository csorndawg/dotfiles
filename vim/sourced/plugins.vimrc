" $HOME/.vim/sourced/plugins.vimrc
" Plugin-specific configurations (keybindings, options, etc.)

" seoul256 colorsheme
set background = dark
let g:seoul256_background = 237
colo seoul256
let g:airline_theme='seoul256.vim'
let g:airline#extensions#tabline#enabled = 1


"   primagen
"   nnoremap <leader>u :UndotreeShow<CR>
"   nnoremap <silent> <leader>ygd :YouCompleter GoTo<CR>        " ygd = YouCompleteMe Get Definition
"   nnoremap <silent> <leader>ygf :YouCompleter FixIt<CR>       " ygf = YouCompleteMe Get Fix
"
"   "   fugative remaps
"   nmap <leader>gs :G<CR>
"   nmap <leader>gh :diffget //3<CR>
"   nmap <leader>gf :diffget //2<CR>
"
"   "   tagbar
"   nmap <leader>b :TagbarToggle<CR>
"

"" ========================================
""      ALE  
"" ========================================
" lint on save only
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" disable fixer
let g:ale_fix_on_save = 0

" error symbols
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" error strings format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

 " easier error cycling w/ `CTRL-e`
 nmap <silent> <C-e> <Plug>(ale_next_wrap)

" display number of errors/warnings in status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d. %d● ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

"" ========================================
""		X
"" ========================================


"" ========================================
""      PLUGIN Y
"" ========================================


"" ========================================
""      PLUGIN Z
"" ========================================


"" ========================================
""      PLUGIN X
"" ========================================


"" ========================================
""      PLUGIN X
"" ========================================

