"==================
" Basics
"==================
set encoding=utf-8 "encoding is utf 8
set fileencoding=utf-8 "file encoding is utf 8
set number "enable line numbers
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "tabs and indentation
let mapleader = "," "set comma as leader
set shortmess=I "don't show the splash screen on startup
set nobackup "get rid of swp files
set timeoutlen=1000 ttimeoutlen=50 "lower timeout for keycode delays
set nowrap "do not wrap lines
autocmd VimResized * wincmd = "keep pane splits equal sizes

"==================
" Plugins
"==================
filetype off "required for vundle
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"begin plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
"end plugins
call vundle#end()

"==================
" Themes
"==================
filetype plugin indent on
if (has("termguicolors"))
    set termguicolors
endif
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

"==================
" Plugin Options
"==================

" Airline
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1 "airline buffer tabs

" Nerdtree
let NERDTreeShowHidden=1 "nerdtree show hidden

"Vim Go
set autowrite
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"

"Ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Ale
let g:ale_fixers = { 'javascript': ['eslint'] }

"vim-jsx
let g:jsx_ext_required = 0

"vim-markdown
let g:markdown_fenced_languages = ['javascript', 'go']

"==================
" Maps
"==================
nmap <leader>f :CtrlP<cr>
nmap <leader>e <Plug>(ale_fix)
nmap \ :NERDTreeToggle<cr>

"Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr>

"Change vimsplit navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Navigate quickfix list
map <C-n> :cnext<cr>
map <C-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>

"Node
nnoremap <leader>rt :Dispatch npm test<cr>

"Golang
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<cr>
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
