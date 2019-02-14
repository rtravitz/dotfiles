"Settings
"================== {{{
set nocompatible                "be iMproved, required
set shortmess=I                 "No splash screen
set number                      "Enable line numbers
set backspace=indent,eol,start  "Makes backspace key more powerful
set showcmd                     "Show me what I am typing
set showmode                    "Show current mode
set noswapfile                  "Don't use swapfile
set nobackup                    "Don't create backup files
set splitright                  "Split vertical windows right to current
set splitbelow                  "Split horizontal windows below current
set encoding=utf-8              "Set default encoding to UTF-8
set autoread                    "Automatically reread changed files without asking
set hidden                      "Hide buffer instead of closing to allow unwritten changes
set noshowmode                  "Show mode with airline instead
set lazyredraw                  "Wait to redraw when running non-typed commands (ex. macros)

"Wrap
set nowrap                      "No wrapping lines
set textwidth=79

"Tabs
set tabstop=2
set shiftwidth=2 
set softtabstop=2 
set expandtab

filetype plugin indent on

"Search
set incsearch                   "Show match while typing
set hlsearch                    "Highlight found searches
set ignorecase                  "Search case insensitive
set smartcase                   " ...except when pattern contains uppercase characters 

"Timeouts
set notimeout                   "Time out on keycodes but not mappings
set ttimeout                    
set ttimeoutlen=10              

"Mouse
if has('mouse')
  set mouse=a
endif

"Open help vertically
"command! -nargs=* -complete=help Help vertical belowright help <args>
"autocmd FileType help wincmd L

let mapleader = "," "Comma as leader
let maplocalleader="," "Comma as localleader
"}}}

"Plugins
"================== {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_auto_install
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'mhartington/oceanic-next'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()
"}}}

"Plugin Options
"================== {{{

"Airline
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1 "airline buffer tabs

"Nerdtree
let NERDTreeShowHidden = 1 "nerdtree show hidden

"Nerdcommenter
let g:NERDSpaceDelims = 1

"Vim Go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"

"Ag
if executable('ag')
  "Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  "Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Ale
let g:ale_fixers = { 'javascript': ['eslint'] }

"vim-jsx
let g:jsx_ext_required = 0

"vim-markdown
let g:markdown_fenced_languages = ['javascript', 'go']

"splitjoin
let g:splitjoin_trailing_comma = 1
"}}}

"Appearance
"=================={{{
augroup pane_splits
  autocmd!
  autocmd VimResized * wincmd = "keep pane splits equal sizes
augroup END

if (has("termguicolors"))
    set termguicolors
endif

colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
"}}}

"Maps
"=================={{{
let g:ctrlp_map = '<leader>f'
nnoremap \ :NERDTreeToggle<cr>
nmap <leader>af <Plug>(ale_fix)
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Navigate quickfix list
nnoremap <c-n> :cnext<cr>
nnoremap <c-p> :cprevious<cr>
nnoremap <leader>ef :cclose<cr>

"Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr>

"Change vimsplit navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"Buffer prev/next
nnoremap <c-x> :bnext<cr>
nnoremap <c-z> :bprev<cr>
"}}}

