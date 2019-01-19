"Basics
"================== {{{
let mapleader = "," "set comma as leader
set encoding=utf-8 "encoding is utf 8
set fileencoding=utf-8 "file encoding is utf 8
set number "enable line numbers
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "tabs and indentation
set shortmess=I "don't show the splash screen on startup
set nobackup "get rid of swp files
set timeoutlen=1000 ttimeoutlen=50 "lower timeout for keycode delays
set nowrap "do not wrap lines
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

filetype plugin indent on
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
nnoremap <leader>af <Plug>(ale_fix)
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

"Languages
"==================

"Vimscript
"------------------
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

"Markdown
"------------------
augroup filetype_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd FileType markdown set wrap
augroup END

"Node
"------------------
augroup filetype_javascript
  autocmd!
  autocmd FileType javascript nnoremap <leader>t :exe '!npm test ' expand('%:t:r:r') . '.test'<cr>
  autocmd FileType javascript nnoremap <leader>ta :!npm test<cr>
  autocmd FileType javascript nnoremap <leader>tc :!npm run coverage<cr>
augroup END

"Golang
"------------------
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup filetype_go
  autocmd!
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
augroup END
"}}}
