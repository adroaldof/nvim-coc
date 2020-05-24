so ~/.config/nvim/plugins.vim

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

