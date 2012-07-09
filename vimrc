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
"set no compatible with vi
no cp
"set line absolute number 
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
" => Appearance setting of document
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
" format the file
map <leader>fm gg=G'.

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Switching Between each window more easier
""""""""""""""""""""""""""""""""""""""""""""""""""
map <Space>h  <C-W>h
map <Space>j  <C-W>j
map <Space>k  <C-W>k
map <Space>l  <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quick fix key binding
""""""""""""""""""""""""""""""""""""""""""""""""""
" next error
map <leader>n :cn<CR>
" previos error
map <leader>m :cp<CR>

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
	cclose
	unlet g:qfix_win
    else
	copen 10
	let g:qfix_win = bufnr("$")
    endif
endfunction
nnoremap <leader>qf :QFix<CR>


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
" set compiler for java for quick fix
autocmd FileType java compiler javac

"java compile => to bin directory in the upper directory
autocmd FileType java map <leader>cp :call CompileJava()<CR>
func! CompileJava()
    :w
    :make -d ../bin "%"
endfunc

" run class => to bin directory in the upper directory
autocmd FileType java map <leader>run :call RunClass()<CR>
func! RunClass()
    :!java -cp "../bin" "%:t:r"
endfunc
