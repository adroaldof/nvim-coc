" =============================================================================
" Plugins
" =============================================================================
call plug#begin('~/.config/nvim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'garbas/vim-snipmate'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dif' : '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'python/black'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'

" Themes (Theme definition: next to line 70)
Plug 'haishanh/night-owl.vim'
Plug 'rakr/vim-one'
let g:one_allow_italics = 1
" Plug 'jacoborus/tender.vim'
" Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1

call plug#end()

" =============================================================================
" ReplaceWithRegister
" ============================================================================
"
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual


" =============================================================================
" Leader
" ============================================================================
"
let mapleader="\<space>"


" =============================================================================
" Bindings
" ============================================================================
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
syntax on
colorscheme night-owl
filetype plugin indent on
hi CursorLine term=bold cterm=bold guibg=#052234

set termguicolors
set encoding=UTF-8
set guifont=Fira\ Code:h15

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0

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
" nnoremap <c-p> :GFiles --cached --others --exclude-standard<cr>

" Ctrl + f to search for a pattern
nnoremap <c-f> :Ag<cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


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
      \ 'colorscheme': 'one',
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


" =============================================================================
" Prettier and ESLint
" =============================================================================
"
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif
"
" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif


" =============================================================================
" Diagnostics or Docs
" =============================================================================
"
nnoremap <silent> K :call CocAction('doHover')<CR>

" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction
"
" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction
"
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" =============================================================================
" Go
" =============================================================================
"
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
" Terraforma
" =============================================================================
"
let g:terraform_fmt_on_save=1
let g:terraform_align=1

