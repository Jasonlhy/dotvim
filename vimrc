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
endif

" Global setting of document
set relativenumber "set line abosulte number
set hlsearch "set hightlight when we do searching
set showcmd "show the comment when we type it
filetype on "detect the file type
filetype plugin on "make plugin on for some filetype
map! jk <Esc><x> "jk to exist non nomral mode
set autochdir

" better looking
set autoindent "auto indent the file
filetype indent on "special indent based on the file type
set t_Co=256 "set 256 colors
colorscheme molokai "set  colortheme
syntax on "display syntax in special color

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
	
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {\ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	        \ }
	
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
" => Java Section
""""""""""""""""""""""""""""""""""""""""""""""""""
"java compile
map <F3> :call CompileJava()<CR>
func! CompileJava()
	:w
	:!javac -d ../bin "%"
endfunc

" run class
	map <F4> :call RunClass()<CR>
	func! RunClass()
	:!java -cp "../bin" "%:t:r"
endfunc
