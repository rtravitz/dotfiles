"===============
"Settings
"===============
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

"===============
"Plugins
"===============
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_auto_install
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/oceanic-next'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'segeljakt/vim-silicon'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

"Plugin Options

"--------
"Airline
"--------
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1 "airline buffer tabs

"--------
"Nerdtree
"--------
let NERDTreeShowHidden = 1 "nerdtree show hidden

"--------
"Nerdcommenter
"--------
let g:NERDSpaceDelims = 1

"--------
"Vim Go
"--------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Tell vim-go to use gopls instead of guru, since guru doesn't seem to be
" module-aware. Some useful docs on `gd`:
"
" By default there is the Vim shortcut ctrl-o that jumps to the previous
" cursor location. It works great when it does, but not good enough if you're
" navigating between Go declarations. If, for example, you jump to a file with
" :GoDef and then scroll down to the bottom, and then maybe to the top, ctrl-o
" will remember these locations as well...

" And because this is also used so many times we have the shortcut ctrl-t

" https://github.com/fatih/vim-go-tutorial#go-to-definition
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Turn off go-vim completion, let's try out ALE first. RN they're fighting
" with each other.
let g:go_code_completion_enabled=0

"--------
"Search
"--------

" ripgrep as vim grep
set grepprg=rg\ --vimgrep
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"--------
"Ale
"--------
" Disable ale fixers for go, currently using vim-go for this
let g:ale_fixers = { 'javascript': ['eslint'], 'ruby': ['rubocop'], 'go': [] }

" turn on gopls and golint linting
let g:ale_linters = { 'go': ['gopls', 'golint'] }

" tell ale to use gopls for completion
let g:ale_go_langserver_executable = 'gopls'

"--------
"vim-jsx
"--------
let g:jsx_ext_required = 0

"--------
"vim-markdown
"--------
let g:markdown_fenced_languages = ['javascript', 'go', 'ruby']

"===============
"Appearance
"===============
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

"===============
"Maps
"===============
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>cp :let @* = expand("%")<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>wq :w\|bd<cr>
nnoremap <leader>tv :windo wincmd H<cr>
nnoremap <leader>th :windo wincmd K<cr>
nnoremap <leader>f :Files<cr>
nnoremap \ :NERDTreeToggle<cr>
nmap <leader>af <Plug>(ale_fix)
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Format json file
nnoremap <leader>j :%!jq ''<CR>

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
nnoremap Ω :bprev<cr>
nnoremap ≈ :bnext<cr>

noremap ≠ :vertical resize +10<cr>
noremap – :vertical resize -10<cr>

"Experimental -> Send a test command to a second tmux pane.
nnoremap <leader>rt :exe ":silent ! tmux send-keys -t 2 'be rspec %' Enter" \| redraw!<CR>

