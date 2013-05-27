""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen Section
""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Zen Coding
""""""""""""""""""""""""""""""""""""""""""""""""""
" from :h zencoding-customize-keymappings "
let g:user_zen_expandabbr_key='<C-b>'
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" => MatchTagAlways
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'eruby' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}

""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoComplCache Setting Examples
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

"set hightlight when we do searching 
set hlsearch
" highlight matching when entering keyword
set incsearch
" show matching when text indictor on it
set showmatch
" define key leader
let mapleader =","
" status bar always shown
set laststatus=2
" short cut to edit the files at the same director as the buffer
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting for convenience
""""""""""""""""""""""""""""""""""""""""""""""""""
" bash-like filename completion
set wildmenu
set wildmode=list:longest
" ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" when the page starts to scroll, keep the cursor 3 lines from the top and the
" bottom
set scrolloff=3

" allow switching edited buffers without saving
set hidden

" turn off annoying error bells
set visualbell
set noerrorbells

" Make backspace delete over line breaks, or automatically-inserted indentation, or the place where insert mode started
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Super editing short cut in insert mode
" => These short cuts is designed for entering the text continuely (Except jk)
" => And reduce the amounts of button pressed 
""""""""""""""""""""""""""""""""""""""""""""""""""
"jk to exist non nomral mode
map! jk <Esc><x> 
"jj going to the head of non-blank character 
map! jj <Esc>^
"ll going to the end 
map! jl <Esc>$

"kk open an line below
map! kk <Esc>o
"kl insert ; EOL and open an line below
map! kl <Esc>$a;<Esc>o



""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance setting of document
""""""""""""""""""""""""""""""""""""""""""""""""""
"special indent based on the file type
filetype indent on 
"set 256 colors
set t_Co=256 
"display syntax in special color
let g:solarized_termcolors=256
syntax on 
set background=dark
colorscheme solarized


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
" use space instead of tab
set expandtab
" 4 space when << and >>
set tabstop=4

" format the file
map <leader>fm gg=G'.
" set cursorline
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile
map <leader>cd :call ChangeDir()<CR>
func! ChangeDir()
    :cd %:p:h
    :echo "Change to current Directory"
endfunc

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
map <leader>nt :NERDTreeFind<CR>
" Open the three starting from the current Directory
let NERDTreeChDirMode=2



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
map <leader>fd :FufDir<CR>

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
