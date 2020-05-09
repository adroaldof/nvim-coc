" =============================================================================
" Fzf 
" =============================================================================
"
Plug 'junegunn/fzf', { 'dif' : '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ctrl + f to find files
nnoremap <c-p> :Files<cr> 

" Ctrl + f to search for a pattern
nnoremap <c-f> :Ag<cr> 
