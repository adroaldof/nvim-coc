" =============================================================================
" Plugins
" =============================================================================
call plug#begin('~/.config/nvim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'garbas/vim-snipmate'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dif' : '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'python/black'
Plug 'ryanoasis/vim-devicons'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

call plug#end()

let mapleader="\<space>"


" =============================================================================
" Bindings
" =============================================================================

" Manage plugins
"
nnoremap <leader>ve :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" Copy to clipboard
"
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Window navigation
"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows with arrow keys
"
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>


" =============================================================================
" Miscellaneous
" =============================================================================
"
colorscheme gruvbox
filetype plugin indent on
syntax enable
hi CursorLine term=bold cterm=bold guibg=#052234

set encoding=UTF-8
set guifont=Fira\ Code:h15


" =============================================================================
" General settings
" =============================================================================
"
set autoread                    " Reload files changed outside vim
set background=dark
set backspace=indent,eol,start  " Allow backspace in insert mode
set cursorline
set hidden			                " Enable background Buffers
set history=1000                " Store lots of :cmd line history
set mouse=a 			              " Enable mouse
set nrformats=                  " Set decimals numbers as default
set number                      " Line numbers are good
set relativenumber              " Set relative numbers to vim
set showcmd                     " Show incomplete commands down the bottom
set showmode                    " Show current mode down the bottom
set spell spelllang=en_us,pt_br " Check spell of the languages
set termguicolors


" =============================================================================
" Indentation
" =============================================================================
"
set autoindent
set expandtab
set linebreak                   " Wrap lines at convenient point
set nowrap                      " Don't wrap lines
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2


" =============================================================================
" Folding
" =============================================================================
"
set foldmethod=indent           " Fold based on indent
set foldnestmax=5               " Deepest fold is 5 levels
set nofoldenable                " Don't fold by default


" =============================================================================
" Scrolling
" =============================================================================
"
set scrolloff=8                 " Start scrolling when 8 lines from margins
set sidescrolloff=15
set sidescroll=1


" =============================================================================
" Search
" =============================================================================
"
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...
set inccommand=split
set incsearch                   " Find the next match as we type the search
set smartcase                   " ...unless we type a capital


" =============================================================================
" Swap Files
" =============================================================================
"
set nobackup
set noswapfile
set nowb



" =============================================================================
" Completion
" =============================================================================
"
" set wildmenu                    " Enable ctrl-n and ctrl-p to scroll through matches
" set wildmode=list:longest
" set wildignore+=*.gem
" set wildignore+=*.png,*.jpg,*.gif
" set wildignore+=*DS_Store*
" set wildignore+=*sass-cache*
" set wildignore+=*vim/backups*
" set wildignore+=__pycache__/**
" set wildignore+=bower_components/**
" set wildignore+=log/**
" set wildignore+=node_modules/**
" set wildignore+=tmp/**
" set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing


" =============================================================================
" Python
" =============================================================================
"
" let g:python_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'
autocmd BufWritePre *.py execute ':Black'


" =============================================================================
" CoC
" =============================================================================
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


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


" =============================================================================
" Vertical line indentation
" =============================================================================
"
" let g:indentLine_color_term = 202
" let g:indentLine_color_gui = '#a4e57e'
let g:indentLine_char = '│'
autocmd Filetype json let g:indentLine_enabled = 0


" =============================================================================
" Vertical line indentation
" =============================================================================
"
" If not work set the follow line on '.vimrc'
set laststatus=2 " Light line configuration

" Use status bar even with single buffer
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'fileformat', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'readonly': 'GetCustomReadOnly',
      \   'fugitive': 'GetGitBranch',
      \   'filename': 'GetFileName'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '|' },
      \ 'subseparator': { 'left': '⮁', 'right': '|' }
      \ }

"      \   'filetype': 'GetFileType',
"      \   'fileformat': 'GetFileFormat'

function! GetCustomReadOnly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤ "
  else
    return ""
  endif
endfunction

function! GetGitBranch()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! GetFileName()
  return ('' != GetCustomReadOnly() ? GetCustomReadOnly() . ' ' : '') .
       \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

function! GetFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! GetFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

