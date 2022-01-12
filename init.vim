" =============================================================================
" Plugins
" =============================================================================
call plug#begin('~/.config/nvim/plugged')

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dif' : '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'python/black'
Plug 'reedes/vim-lexical'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'

" Theme
" Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }


call plug#end()


" =============================================================================
" Theme related
" =============================================================================

set t_Co=256
set background=dark
colorscheme onehalfdark

set encoding=UTF-8
set guifont=Fira\ Code:h12

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:allow_bold = 1
let g:allow_italic = 1
let hightlight_builtins = 1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" =============================================================================
" Leader
" ============================================================================

let mapleader="\<space>"


" =============================================================================
" Configuration and plugin management
" =============================================================================
"
nnoremap <leader>ve :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>vc :vsplit ~/.config/nvim/coc-settings.json<CR>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>


" =============================================================================
" ReplaceWithRegister
" ============================================================================

nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Copy to clipboard
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy "+yy


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Navigate between views
"  CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Nerdtree
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

map <c-b> :NERDTreeToggle<CR>

let g:webdevicons_enable_nerdtree = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Dirty'     :'✗',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Unknown'   :'?',
  \ }

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let NERDTreeIgnore=['__pycache__', '.vscode']


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Resize windows with arrow keys
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right> <C-w>>


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Snippets configurations
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Show cursor only in the active view
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Some remaps
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

nnoremap Y y$                   " Yank until the end of line
nnoremap n nzzz                 " Keep centered on next find word
nnoremap N Nzzz                 " Keep centered on back find word
nnoremap J mzJ`z                " Keep centered in line concatenation

" Moving text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Highlight yanked text
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * call FlashYankedText()
augroup END

function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif

    let matchId = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(500, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
    while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]

        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction


" =============================================================================
" General settings
" =============================================================================

set autoread                    " Reload files changed outside vim
set backspace=indent,eol,start  " Allow backspace in insert mode
set confirm                     " Raise a dialog instead of failing a command
set gcr=a:blinkon0              " Disable cursor blink
set hidden                      " Hide buffers from editor window
set history=1000                " Store lots of :cmdline history
set lazyredraw                  " Redraw screen only when it is needed
set nostartofline               " Stop certain movements from always going to the first char of a line
set nrformats=                  " Set decimals numbers as default
set number                      " Line numbers are good
set relativenumber              " Set relative numbers to vim
set showcmd                     " Show incomplete commands down the bottom
set showmatch                   " Show the matching brackets
set showmode                    " Show current mode down the bottom
set visualbell                  " No sounds


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Cursor
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set cursorline                  " Enable cursor line
" set cursorcolumn                " Enable cursor column


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Spelling Configurations
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set spell spelllang=en_us,pt_br  " Set spell checker

augroup lexical
    autocmd!
    autocmd FileType markdown,mkd,py call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us','pt_br',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/moby_thesaurus.txt',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Indentation
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set autoindent                  " Copy indent from current line when starting a new line
set expandtab                   " Use the appropriate number of spaces to insert a <Tab>
set linebreak                   " Wrap lines at convenient points
set nowrap                      " Don't wrap lines
set shiftwidth=2                " Number of spaces to use for each step of (auto)indent
set smartindent                 " Automatically follow the indentations
set smarttab                    " Insert blanks according the following settings
set softtabstop=2               " Number of spaces that a <Tab> counts for
set tabstop=2                   " Number of spaces that a <Tab> counts for

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

set list
set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»

" Yggdroot/indentLine options
let g:indentLine_char = '┊'
let g:indentLine_color_gui = '#1c1c1c'


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Files
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

syntax on                       " Turn on syntax highlighting
filetype plugin on
filetype indent on


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Turn Off Swap Files
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set noswapfile
set nobackup
set nowb
set nowritebackup


" =============================================================================
" Folding
" =============================================================================

set foldmethod=indent           " Fold based on indent
set foldnestmax=5               " Deepest fold is 5 levels
set nofoldenable                " Don't fold by default


" =============================================================================
" Scrolling
" =============================================================================

set scrolloff=8                 " Start scrolling when 8 lines from margins
set sidescrolloff=15
set sidescroll=1


" =============================================================================
" Search
" =============================================================================

set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching
set incsearch                   " Find the next match as we type the search
set smartcase                   " When type capital use it


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Code completion
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest       " Wildmode type
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=bower_components/**
set wildignore+=log/**
set wildignore+=node_modules/**
set wildignore+=tmp/**


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Persistent undo history across sessions
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Enable mouse
" ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

if has('mouse')
    set mouse=a
endif


" =============================================================================
" Fzf - search and file oppener
" =============================================================================

Plug 'junegunn/fzf', { 'dif' : '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Ctrl + f to find files
nnoremap <c-p> :Files<cr>
" nnoremap <c-p> :GFiles --cached --others --exclude-standard<cr>

" Ctrl + f to search for a pattern
nnoremap <c-f> :Ag<cr>

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }


" =============================================================================
" Vertical line indentation
" =============================================================================

" let g:indentLine_char = '│'
" autocmd Filetype json let g:indentLine_enabled = 0


" =============================================================================
" Vertical line indentation
" =============================================================================

let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
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


" =============================================================================
" CoC
" =============================================================================

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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

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
" Go
" =============================================================================

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" Status line types/signatures
let g:go_auto_type_info = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-coverage-toggle)


" =============================================================================
" Terraform
" =============================================================================

let g:terraform_fmt_on_save=1
let g:terraform_align=1


" =============================================================================
" Python
" =============================================================================

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']


let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
autocmd BufWritePre *.py execute ':Black'
" autocmd BufWritePre *.py execute ':CocCommand python.sortImports'


" =============================================================================
" JS
" =============================================================================

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif
"
" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif

let g:js_file_import_sort_after_insert = 1

