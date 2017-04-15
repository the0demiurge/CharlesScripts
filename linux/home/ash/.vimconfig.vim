set shell=/bin/zsh
map <C-J> :join<CR>

"Emmet
imap <expr> <S-Tab> emmet#expandAbbrIntelligent("\<S-Tab>")
let g:user_emmet_expandabbr_key ='<S-Tab>'

"UltiSnips
let g:UltiSnipsExpandTrigger="<C-l>"

"YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>', '<Tab>']

"airline

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 0

