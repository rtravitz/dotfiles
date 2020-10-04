"===============
"Settings
"===============
set shortmess=It                "No splash screen and truncate file message
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
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'segeljakt/vim-silicon'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-tbone'
call plug#end()

"Plugin Options

"--------
"Nerdtree
"--------
let NERDTreeShowHidden = 1 "nerdtree show hidden

"--------
"Nerdcommenter
"--------
let g:NERDSpaceDelims = 1

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
vnoremap <leader>0 :Twrite 0<CR>
vnoremap <leader>1 :Twrite 1<CR>
vnoremap <leader>2 :Twrite 2<CR>
vnoremap <leader>3 :Twrite 3<CR>
vnoremap <leader>4 :Twrite 4<CR>
vnoremap <leader>5 :Twrite 5<CR>
vnoremap <leader>6 :Twrite 6<CR>

nnoremap <leader>g :Clap grep<cr>

nnoremap <leader>nf :NERDTreeFind<cr>

"copy buffer path to system clipboard
nnoremap <leader>cp :let @* = expand("%")<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>q :bd<cr>

"to vertical: takes horizontal splits and makes them vertical
nnoremap <leader>tv :windo wincmd H<cr>

"to horizontal: takes vertical splits and makes them horizontal
nnoremap <leader>th :windo wincmd K<cr>

"fuzzy finding with fzf
nnoremap <leader>f :Files<cr>
nnoremap \ :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Format json
nnoremap <leader>j :%!jq ''<cr>

"Format html
nnoremap <leader>h :%!xmllint --format --encode UTF-8 --html -<CR>

"Format xml
nnoremap <leader>x :%!xmllint --format -<CR>

"Format yaml
nnoremap <leader>y :%!yq r -<CR>

"Markdown to Jira format
nnoremap <leader>tj :%!pandoc -f markdown -t jira -<CR>

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

"Buffer prev/next as encoded alt+z or alt+x on macOS
nnoremap Ω :bprev<cr>
nnoremap ≈ :bnext<cr>

"Resize split horizontally encoded as alt+= and alt+- on macOS
noremap ≠ :vertical resize +10<cr>
noremap – :vertical resize -10<cr>

"Experimental -> Send a test command to a second tmux pane.
nnoremap <leader>rt :exe ":silent ! tmux send-keys -t 2 'be rspec %' Enter" \| redraw!<CR>

" Repeat last command in the next tmux pane.
nnoremap <leader>r :call <SID>TmuxRepeat()<CR>

function! s:TmuxRepeat()
  silent! exec "!tmux select-pane -l && tmux send up enter && tmux select-pane -l"
  redraw!
endfunction

"=======================
"COC.nvim
"=======================
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"format code on <cr>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-go', 'coc-html', 'coc-json', 'coc-yaml', 'coc-solargraph', 'coc-tsserver', 'coc-prettier']

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

