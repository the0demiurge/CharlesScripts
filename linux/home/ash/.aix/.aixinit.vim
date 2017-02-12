" ========================= Normal Setting Start =========================

"Set windows pos and resize
set lines=38
set columns=80

" ## Make its Gvim Like Windows behave ##
" So you can use
" @ CTRL+S save the file
" @ CTRL+C copy text
" @ CTRL+P paste text
" @ CTRL+X cut text
"behave mswin

" Format
set nu
set noexpandtab
set copyindent
set preserveindent
set tabstop=2 "4
set shiftwidth=2 "4
set softtabstop=0 "4
set autowrite
set display=lastline

" Encoding setting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8
language messages en_US.utf-8

" For indent
set wrap
set autoindent
set smartindent
set smarttab
set cindent
set linebreak
set shiftround

" Search and Case
set gdefault
set hlsearch
set incsearch
set ignorecase
set fileignorecase
set showcmd
set whichwrap+=<,>,h,l

" Omni Complete Setting
set wildmenu
set wildmode=longest,full
set completeopt=menu,menuone,longest
set completeopt+=preview
set switchbuf=useopen,usetab
set shortmess=a

" No back up files
set nobackup
set nowritebackup
set noswapfile

" Rule the define
set noshowmode
set ruler
set cursorline
set winaltkeys=no

" Advance config
set magic
set lazyredraw
set ttyfast
set hidden
"set autochdir
set autoread
"set showmatch
set laststatus=2
set cmdheight=1
set modelines=1

" No surround sound
set noerrorbells
set novisualbell
set t_vb=

" Set Fold config
" set foldmethod=syntax
set foldenable

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac

" Set Spliter
set splitright
set splitbelow

" set Undo file
set undofile
if(has('win32'))
	set undodir=$VIM/vimfiles/undo/
else
	set undodir=~/.vim/undo/
endif
set viminfo+=!

" Diff GUI Vim with NVim
" Set No Top Menu and Scroll
if has("gui_running")
	set guioptions-=e
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
	set guioptions-=B
	set guioptions-=0
	set go=
	set guitablabel=
	set paste
	" set mousemodel=popup_setpos
	" set mouse-=a
	"set guitablabel=%M\ %t

	" Fonts Settings
	"set guifont=ProfontWindows\ 9
	"set guifont=IBM\ 3270\ Narrow\ Medium\ 10
	if(has('win32')) 
		set guifont=Consolas_for_Powerline_FixedD:h10:cANSI
	elseif(has('osx'))
		set guifont=Aix:h14
	else
		set guifont=Aix\ 9
	endif

	map <silent> <F1> :if &guioptions =~# 'T' <Bar>
				\set guioptions-=T <Bar>
				\set guioptions-=m <bar>
				\else <Bar>
				\set guioptions+=T <Bar>
				\set guioptions+=m <Bar>
				\endif<CR>
else
	set t_Co=256
	set showtabline=2
		set noimd
	set ttimeoutlen=0
	if len($TMUX) > 0
		" set screen title to vim $PWD folder name - format 'v:folder'
		set titlestring=v:%(%{fnamemodify(expand(\"$PWD\"),\":t\")}%)
		set t_ts=k
		set t_fs=\
		set title
	endif
endif

" Setting Spell Checker
set spelllang=en_us                      " spelling options
if(!has('win32'))
	set spellfile=~/.vim/spell/en.utf-8.add  " spell files added with `zg`
	set dictionary+=/usr/share/dict/words
endif

" Fix Fucking Vim Prefix for GTK
set backspace=indent,eol,start

" setting the tabs like that
" set list listchars=tab:→\ ,trail:\ 
" set list listchars=tab:▸\ 
"set list listchars=tab:-\ ,trail:\ 
set list listchars=tab:-\ ,extends:>,precedes:<

if(has('win32'))
	" Windows system using Directx to rendering
	set renderoptions=type:directx,renmode:5,taamode:1

	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" ========================= Normal Setting End =========================
