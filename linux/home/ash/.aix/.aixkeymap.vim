" ========================= KeyFire Setting Start =========================

" -------------------- User Binding ------------------------

map <C-J> :join<CR>

" -------------- Tooling Function Binding ------------------

" Lookup HighLight Syntax Define
function! <SID>SynStack()
	echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
	let spccol = repeat(' ', a:cols)
	let result = substitute(a:indent, spccol, '\t', 'g')
	let result = substitute(result, ' \+\ze\t', '', 'g')
	if a:what == 1
		let result = substitute(result, '\t', spccol, 'g')
	endif
	return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
	let savepos = getpos('.')
	let cols = empty(a:cols) ? &tabstop : a:cols
	execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
	call histdel('search', -1)
	call setpos('.', savepos)
endfunction

" Space2Tab
" Tab2Space
" RetabIndent
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'ag'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" -------------- Tooling Function Ending ------------------

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TableModeToggle<CR>
nnoremap <F4> :exec exists('syntax_on') ? 'syn off': 'syn on'<CR>
nnoremap <F5> :TagbarToggle<CR>
nnoremap <F6> :SyntasticToggleMode <CR>
nnoremap <F7> :GundoToggle<CR>
nnoremap <F8> mzgg=G`z
nnoremap <F9> ggVG:RetabIndent<CR>
" Full Fucking Window ^M ending line file!
nnoremap <F10> :%s////g

" Normal Key Map
nnoremap U :redo<CR>
nnoremap Q :q!<CR>
nnoremap W :w!<CR>

" Window VertSplit switcher
nnoremap <leader>hh <C-w>h
nnoremap <leader>jj <C-w>j
nnoremap <leader>kk <C-w>k
nnoremap <leader>ll <C-w>l

" Set as toggle foldcomment
nnoremap zc @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>
nnoremap zc @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>
nnoremap zr zR
" Fast searcher
nnoremap z, :FZF --no-mouse .<CR>

nnoremap ' `
nnoremap ` '
nnoremap <silent> zj o<ESC>k
nnoremap <silent> zk O<ESC>j

" Format Jump
nnoremap <silent> g; g;zz
nnoremap <silent> g: g:zz

" Smooth Scroll the terminal
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" Cursor Moving
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <Right>

cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <M-h> <Left>
cnoremap <M-l> <Right>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <Left>
inoremap <M-l> <Right>

" Like Emacs
inoremap <C-e> <End>
inoremap <C-f> <Home>
inoremap <C-d> <Esc>VypA
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b
vnoremap <C-c> "+y 

" TabLine Tab configure KeyFire
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tc :tabclose<CR>

" Buffers KeyFire 
nnoremap <leader>b :buffers<CR>

" Buftabline Config Manager
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-x> :bdelete<CR>

" Check Vim Syntax name Fn
nnoremap <leader>yi :call <SID>SynStack()<CR>
nnoremap <leader>w  :w!<CR>
nnoremap <leader>q  :q<CR>
nnoremap <C-v> <ESC>"+gpa
cnoremap <C-v> <C-R>+

" repeat Preview Command
nnoremap <leader>. @:
vnoremap <leader>. :normal .<CR>

" Unite file configure
nnoremap <leader>uf :Unite -buffer-name=files -start-insert file_rec/async:!<CR>
nnoremap <leader>uh :Unite neomru/file -buffer -focus<CR>
nnoremap <leader>us :Unite grep:.<CR>
nnoremap <leader>uw :Unite grep:.<CR><C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>uo :Unite outline -focus<CR>
nnoremap <leader>ub :Unite file buffer<CR>

" Split faster
nnoremap <leader>\ :vs<CR>
nnoremap <leader>- :sp<CR>

" Fast to copy files path
nnoremap <leader>p "+gp
vnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cp :let @+=expand("%:p")<CR>:echo "Copied current file
			\ path '".expand("%:p")."' to clipboard"<CR>

" Vundle keyfire
nnoremap <leader>vi :PluginInstall<CR>
nnoremap <leader>vu :PluginUpdate<CR>

" Tabluer Format
vnoremap <leader>t :Tabularize/
vnoremap <leader>t= :Tabularize/=<CR>
vnoremap <leader>t, :Tabularize/,<CR>
vnoremap <leader>t: :Tabularize/:<CR>
vnoremap <leader>t; :Tabularize/;<CR>

" <leader>s: Spell checking shortcuts
" fold enable settings
nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sj ]szz
nnoremap <leader>sk [szz
nnoremap <leader>sa zg]szz
nnoremap <leader>sd 1z=
nnoremap <leader>sf z=

" Multi Cursor Find
vnoremap <leader>mf :MultipleCursorsFind 
vnoremap <leader>s :call VisualSelection('ag', '')<CR>

" Multi Expand Region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" For Git fire
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit
nnoremap <leader>gb :Gblame
nnoremap <leader>gv :Gitv<CR>
nnoremap <leader>gp :Git push origin master<CR>
nnoremap <leader>gu :Git pull -u<CR>

" For SVN fire
nnoremap <leader>sc :!svn ci -m ""<CR>
nnoremap <leader>su :!svn up<CR>
nnoremap <leader>st :!svn st<CR>

" Editor dotfile
nnoremap <leader>en :e! ~/.nvimrc<CR>
nnoremap <leader>ev :e! ~/.vimrc<CR>

" Incsearch
" map / <Plug>(incsearch-forward)
" map ? <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" map n <Plug>(incsearch-nohl-n)zzzv
" map N <Plug>(incsearch-nohl-N)zzzv
" map * <Plug>(incsearch-nohl-*)zzzv
" map # <Plug>(incsearch-nohl-#)zzzv
" map g* <Plug>(incsearch-nohl-g*)zzzv
" map g# <Plug>(incsearch-nohl-g#)zzzv

" Vim-quickhl 
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"Sneak
"replace 'f' with 1-char Sneak
"nmap f <Plug>Sneak_f
"nmap F <Plug>Sneak_F
"xmap f <Plug>Sneak_f
"xmap F <Plug>Sneak_F
"omap f <Plug>Sneak_f
"omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
"nmap t <Plug>Sneak_t
"nmap T <Plug>Sneak_T
"xmap t <Plug>Sneak_t
"xmap T <Plug>Sneak_T
"omap t <Plug>Sneak_t
"omap T <Plug>Sneak_T

" ========================= KeyFire Setting End =========================
