nnoremap <localleader>t :exe '!npm test ' expand('%:t:r:r') . '.test'<cr>
nnoremap <localleader>ta :!npm test<cr>
nnoremap <localleader>tc :!npm run coverage<cr>

let g:ale_fixers = { 'javascript': ['eslint'] }
