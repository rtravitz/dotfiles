"===============================================
"Usability
"===============================================

"Don't try to work with older versions
set nocompatible

"encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

"Change to system clipboard
set clipboard=unnamed

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
map <SPACE> <leader>

"Colorscheme
colorscheme molokai
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None

" Switch syntax highlighting on
syntax on

" Don't show the splash screen on startup
set shortmess=I


"===============================================
"Plugins
"===============================================
filetype off         " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" begin plugins
Plugin 'kien/ctrlp.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'itchyny/lightline.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" end plugins
call vundle#end()
filetype plugin indent on


"===============================================
"Plugin Settings
"===============================================

"Nerdtree keys
nmap <leader>n :NERDTreeToggle<CR>

"Fixing lightline status bars
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
if !has('gui_running')
    set t_Co=256
endif

"For ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
