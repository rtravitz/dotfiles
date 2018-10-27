"===============================================
"Usability
"===============================================

"Don't try to work with older versions
set nocompatible

"encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

"Enable Line Numbers"
set number

"===============================================
"Customization
"===============================================

" tabs and indentation
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent

" set space as leader
let mapleader = ","

" Switch syntax highlighting on
syntax on

" Don't show the splash screen on startup
set shortmess=I

"Get rid of swp files
set nobackup

"Lower timeout for keycode delays
set timeoutlen=1000 ttimeoutlen=50

"Keep pane splits equal sizes
autocmd VimResized * wincmd =

"===============================================
"Plugins
"===============================================
filetype off         " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mhartington/oceanic-next'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet-snippets'

call vundle#end()
filetype plugin indent on

"===============================================
"Plugin Settings
"===============================================

"Neocomplete
let g:neocomplete#enable_at_startup=1

"Nerdtree
let NERDTreeShowHidden=1

"Fixing lightline status bars
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
if !has('gui_running')
    set t_Co=256
endif

"Vim Go
set autowrite
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"===============================================
"Search
"===============================================
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"===============================================
"Colorscheme
"===============================================
"set background=dark
"let g:rehash256 = 1
"let g:molokai_original = 1
syntax enable
if (has("termguicolors"))
  set termguicolors
endif

colorscheme OceanicNext

"===============================================
"Maps
"===============================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap ,f :CtrlP<CR>
nmap \ :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>d  <Plug>(gogetdoc)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)


