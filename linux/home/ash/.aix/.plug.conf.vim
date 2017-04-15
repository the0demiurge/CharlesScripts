" ========================= Plugin Config Start =========================
" Set Ale Cheacker
let g:ale_sign_error = 'o'
let g:ale_sign_warning = '*'

" AirLine Settings
let g:airline_powerline_fonts = 1
let g:airline_theme='serene'
" let g:airline_theme='jellybeans'
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" fzf Setting
set rtp+=~/.fzf

"------------------ YouCompleteMe -------------------
" Linux vim && NeoVim Using YouCompleteMe
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_cache_omnifunc = 1
let g:ycm_max_diagnostics_to_display=10
let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>']
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'qf' : 1,
			\ 'notes' : 1,
			\ 'markdown' : 1,
			\ 'unite' : 1,
			\ 'text' : 1,
			\ 'vimwiki' : 1,
			\ 'pandoc' : 1,
			\ 'infolog' : 1,
			\ 'mail' : 1,
			\ 'mundo': 1,
			\ 'fzf': 1,
			\ 'ctrlp' : 1
			\}

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Emmet Config
" change <Tab> config , if use [YouCompleteMe]
let g:user_emmet_expandabbr_key ='<Tab>'

let g:user_emmet_settings = {
			\ 'php'     : {
			\ 'extends' : 'html',
			\ 'filters' : 'c',
			\ },
			\ 'xml'     : {
			\ 'extends' : 'html',
			\ },
			\ 'haml'    : {
			\ 'extends' : 'html',
			\ },
			\ 'phtml'    : {
			\ 'extends' : 'html',
			\ }
			\}

" GitGutter Setting
let g:gitgutter_sign_column_always = 0
let g:gitgutter_max_signs = 99999

" Ag.vim Settings
let g:ackprg = "ag --nocolor --nogroup --column"
set grepprg=ag\ --nogroup\ --nocolor

" Multip Cursor
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Vim incsearch
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1

" Python snytax configure
let python_self_cls_highlight = 1

" ColorFul NERDTree Settings
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeDirArrows=0

" DevIcons Config
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_enable_unite = 1
" let g:webdevicons_enable_vimfiler = 1
" let g:WebDevIconsUnicodeDecorateFileNodes = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
"

" auto complete
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:jsx_ext_required = 0
"========================= Plugin Config End =========================


