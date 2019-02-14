" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

nmap <localleader>b :<C-u>call <SID>build_go_files()<CR>
nmap <localleader>t <Plug>(go-test)
nmap <localleader>r <Plug>(go-run)
nmap <localleader>c <Plug>(go-coverage-toggle)
nmap <localleader>s <Plug>(go-def-split)
nmap <localleader>v <Plug>(go-def-vertical)
nmap <localleader>i <Plug>(go-info)
nmap <localleader>d <Plug>(go-doc)
nmap <localleader>n <Plug>(go-rename)

