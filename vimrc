""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen Section
""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Section
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	"" specail setting
	set guioptions-=T "remove toolbar
	set guioptions-=r "remove left scrollbar
	set guioptions-=l "remove right scrollbar
	set guifont=Monaco:h14 "great front
	
	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {\ 'default' : '',
		    \ 'vimshell' : $HOME.'/.vimshell_hist',
		    \ 'scheme' : $HOME.'/.gosh_completions'
			\ }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global setting of document
""""""""""""""""""""""""""""""""""""""""""""""""""
"set line abosulte number 
set relativenumber 
"show the comment when we type it
set showcmd 
"detect the file type
filetype on 
"make plugin on for some filetype
filetype plugin on 
"jk to exist non nomral mode
map! jk <Esc><x> 
"change to the directory of the file opening
set autochdir
"set hightlight when we do searching 
set hlsearch
" highlight matching when entering keyword
set incsearch
" show matching when text indictor on it
set showmatch
" define key leader
let mapleader =","

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearence setting of document
""""""""""""""""""""""""""""""""""""""""""""""""""
"special indent based on the file type
filetype indent on 
"set 256 colors
set t_Co=256 
"set  colortheme
colorscheme molokai 
"display syntax in special color
syntax on 


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
"auto indent of new line accoring to the previous line
set autoindent 
"smart indent for c program
set smartindent
" add tab of new line
set smarttab
" define smarttab length
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeocomplCache section
""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	
	
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTreeSection
""""""""""""""""""""""""""""""""""""""""""""""""""
" open a tree
map <leader>tr :NERDTreeFind<CR>
"close tree when open a file
let g:NERDTreeQuitOnOpen=1


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist Section
""""""""""""""""""""""""""""""""""""""""""""""""""
" Only show the tags for active buffer, others are folded 
let g:Tlist_File_Fold_Auto_Close =1

map <leader>lt :call LoadCurrentFolder()<CR><CR>
map <leader>ct :TlistClose<CR>
map <leader>ut :TlistUpdate<CR>
map <leader>ss :call SaveSession()<CR>
map <leader>ls :call LoadSession()<CR>

" make tags for all file in the current directory
func! LoadCurrentFolder()
    :TlistAddFiles . *
    :TlistOpen 
endfunc

" save the session for taglist and program
func! SaveSession()
    :TlistSessionSave ../session/TagSession.vim
    :mks! ../session/ProgramSession.vim
endfunc

" load the session for taglist and program 
func! LoadSession()
    :TlistSessionLoad../session/TagSession.vim
    :source ../session/ProgramSession.vim
    :TlistOpen
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""
" => FuzzyFinder Section
""""""""""""""""""""""""""""""""""""""""""""""""""
" Find file 
map <leader>ff :FufFile<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Java Programming Section
""""""""""""""""""""""""""""""""""""""""""""""""""
"java compile => to bin directory in the upper directory
autocmd FileType java map <leader>cp :call CompileJava()<CR>
func! CompileJava()
	:w
	:!javac -d ../bin "%"
endfunc

" run class => to bin directory in the upper directory
autocmd FileType java map <leader>run :call RunClass()<CR>
	func! RunClass()
	:!java -cp "../bin" "%:t:r"
endfunc
