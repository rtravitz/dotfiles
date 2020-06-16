" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

nmap <localleader>gb :<C-u>call <SID>build_go_files()<CR>
nmap <localleader>gt <Plug>(go-test)
nmap <localleader>gr <Plug>(go-run)
nmap <localleader>gc <Plug>(go-coverage-toggle)
nmap <localleader>gs <Plug>(go-def-split)
nmap <localleader>gv <Plug>(go-def-vertical)
nmap <localleader>gi <Plug>(go-info)
nmap <localleader>gd <Plug>(go-doc)
nmap <localleader>gn <Plug>(go-rename)

"--------
"Vim Go
"--------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"language server support for go
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

"manages imports on save in addition to formatting
let g:go_fmt_command = 'goimports'

