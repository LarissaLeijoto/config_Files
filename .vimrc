" -----------------------------------------------------------------"
"                                                                  "
"                                                                  "
"    		  Federal University of Minas Gerais - UFMG            "
"      				 Computer Science Department                   "
"																   "
"                     Larissa Fenandes Leijôto              	   "
"																   "
"----------------------------------------------------------------- "
" VIM configuration
execute pathogen#infect()
call pathogen#infect("after/{}")

"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" general configurations
set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
"set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

" Indentation
set foldenable
" use intelligent indentation for C
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab     " expand tabs to spaces

" use indentation of previous line
set autoindent
filetype indent on
filetype on

" Mappings
map <Enter><Enter> :noh<Enter>
map <Enter><up><up> :%s/\s*$//<Enter>
noremap <C-c><C-c> <esc>:w<cr><esc>:!make<cr>
inoremap <C-c><C-c> <esc>:w<cr><esc>:!make<cr>

" Read/write
set nobk

" Tagbar configuration
let g:tagbar_left=1

" general configuration
set number
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ Line:\ %l/%L:%c
set mouse+=a
set ruler
set copyindent
set syntax=markdown

" Show undo tree
nnoremap <F9> :NERDTree <CR>
imap <F9> <C-O><F3>

"Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0 
let Tlist_Auto_Update = 0
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1

" Colors and highlighting
set hlsearch
set incsearch
set showmatch
set smartcase

" Solarized Dark
syntax enable 
set t_Co=256
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized 

" molokai
let g:molokai_original = 1
let g:rehash = 1
colorscheme molokai

set cursorline
hi CursorLine term=bold cterm=underline guibg=Grey40

" spell configuration
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au! BufNewFile,BufRead * let b:spell_language="brasileiro"
let spell_language_list="brasileiro,american"
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline
" Line colors and bars
hi LineNr ctermfg=4
set colorcolumn=80
hi ColorColumn ctermbg=4
set wrap
set linebreak
set nolist
set textwidth=80
set wrapmargin=80


"If you want to keep your existing 'textwidth' settings for most lines
"in your file, but not have Vim automatically reformat when typing on
"existing lines, you can do this with:
"set formatoptions-=t

"If you want Vim to adjust textwidth automatically most of the time but
"you have a few long lines that you don't want to change, use:
set formatoptions+=l

" Enhanced keyboard mappings

" copy to clipboard
set clipboard=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap <C-v> <Esc><C-v>a

" Select all (ctrl+a)
map <silent> <C-A> gg0vG$
imap <C-A> <ESC><C-A>

"in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]> My own license
"show functions
nmap <F8> :TagbarToggle<CR>

"Doxygen options
set syntax=cpp.doxygen 
let g:DoxygenToolkit_commentType = "C"
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_colour=1
map <F1> :Dox<CR>
imap <F1> <C-O><F1>
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_briefTag_funcName = "yes" 
let g:DoxygenToolkit_blockHeader="=========================================================================="
let g:DoxygenToolkit_blockFooter="=========================================================================="
let g:DoxygenToolkit_authorName="Larissa Fernandes Leijôto"
let g:DoxygenToolkit_licenseTag=""
" Headers
au BufNewFile *.R call RConfig()
au BufNewFile *.c call CConfig()
au BufNewFile *.cpp,*.cc call CPPConfig()
au BufNewFile *.awk call AwkConfig()
au BufNewFile *.sh call ShellConfig()
au BufNewFile *.py call PythonConfig()
au BufNewFile *.hs call HaskellConfig()
au BufNewFile *.tex,*.tikz call TexConfig()

au BufRead,BufNewFile *.md setlocal textwidth=70
au BufRead,BufNewFile *.tex,*.tikz set filetype=tex
au BufRead,BufNewFile *.elf,*.thm,sources.cfg set filetype=twelf

let c_no_curly_error=1
au BufRead,BufNewFile *.cpp,*.hpp syn keyword Constant nullptr

"---------------------------------------------------------------------
" Language oriented configurations

" R Script
function RConfig()
	0r ~/.vim/templates/R
	norm G4
	d d
	8
	startinsert!
endfunction

" C Script
function CConfig()
	0r ~/.vim/templates/c
	norm G4
	d d
	8
	startinsert!
endfunction

" C++ Script
function CPPConfig()
	0r ~/.vim/templates/cpp
	norm G
	d d
	8
	startinsert!
endfunction

" Shell Script
function ShellConfig()
	0r ~/.vim/templates/shell
	norm G4
	startinsert!
endfunction

" Awk Script
function AwkConfig()
	0r ~/.vim/templates/awk
	norm G4
	startinsert!
endfunction

" Python Script
function PythonConfig()
	0r ~/.vim/templates/python
	norm G4
	startinsert!
endfunction

" Haskell Script
function HaskellConfig()
	0r ~/.vim/templates/haskell
	norm G
	d d
	startinsert!
endfunction

" Latex Script
function TexConfig()
	0r ~/.vim/templates/latex
	norm G
	startinsert!
endfunction
