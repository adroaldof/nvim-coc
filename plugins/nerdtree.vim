" =============================================================================
" Nerd Tree 
" =============================================================================
"
Plug 'scrooloose/nerdtree'

let NERDTreeShowHidden = 1
" let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeIgnore=['__pycache__', '.vscode', '.git', '.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map NERDTree Toggle to C-N
map <C-n> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


" =============================================================================
" Nerd Tree helpers
" =============================================================================
"
Plug 'Xuyuanp/nerdtree-git-plugin'      " Show git status flags

" let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" =============================================================================
" Nert Tree syntax highlight
" =============================================================================
"
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" =============================================================================
" Icons
" =============================================================================
"
Plug 'ryanoasis/vim-devicons'

