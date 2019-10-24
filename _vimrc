set pastetoggle=<F2>
set clipboard=unnamed

" map sort function to a key
vnoremap <Leader>s :sort<CR>

set nu
" Pathogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
syntax on

"Disable sourcing in the SDETools vim stuff
"source /apollo/env/envImprovement/var/vimrc

" Set color scheme
colo torte

"NERDTree key mappings
map <C-n> :NERDTreeToggle<CR>
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
map <C-h> :wincmd h<CR>
map <C-l> :wincmd l<CR>
" map <C-m> :wincmd j<CR>

"Have NERDTree show hidden file
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp']  "ignore files in NERDTree

"NERDTree mouse support
let g:NERDTreeMouseMode=3


"Manage remaining plugins with Vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Vim Dispatch
Plugin 'tpope/vim-dispatch'
" Tmux line
Plugin 'edkolev/tmuxline.vim'
" Start Tmux from VIM
Plugin 'ervandew/screen'

" Good looking bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fuzzy finder (CTRL+P)
Plugin 'kien/ctrlp.vim'

" Silver Searcher 
Plugin 'mileszs/ack.vim'

"
" Commentary
Plugin 'tpope/vim-commentary'
" Bufkill -use :BD to close a buffer
Plugin 'vim-scripts/bufkill.vim'

" YAML plugin
Plugin 'avakhov/vim-yaml'
Plugin 'tmhedberg/SimpylFold'
" Flake 8
"Plugin 'nvie/vim-flake8'
" auto-indent
Plugin 'vim-scripts/indentpython.vim'

" jedi-vim and Supertab
" Plugin 'davidhalter/jedi-vim'
" Plugin 'ervandew/supertab'
" vim-pyenv - must be loaded *after* jedi-vim to satisfy dependency
" Plugin 'lambdalisue/vim-pyenv'
" vim-virtualenv for python virtualenv
"Plugin 'jmcantrell/vim-virtualenv'

Plugin 'majutsushi/tagbar'

" Python-mode
" Plugin 'klen/python-mode.git'

" Plugin that gets current function your editing
Plugin 'tyru/current-func-info.vim'


" ###########################################
" Plugins specifically for C development here
" ###########################################
"
" CMake
Plugin 'vhdirk/vim-cmake'
" Quick List toggling
Plugin 'Valloric/ListToggle'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Switch easily from .h and .c files
Plugin 'vim-scripts/a.vim'


call vundle#end()
filetype plugin indent on


" Function to set the screen title
function! SetTitle()
        let l:title = 'vi: ' . expand('%:t')
        let l:truncTitle = strpart(l:title,0,30 )
        silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'
endfunction

autocmd BufEnter * call SetTitle()

"Show buffers in a tab-like tabline at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"Show only the filename in the tab/buffer
let g:airline#extensions#tabline#fnamemod = ':t'
"Other airline configs
let g:airline_powerline_fonts = 1



nnoremap <leader>co :copen<CR>

"Close the preview window. Was used in pymode for documenation preview and
"code ouput window

nnoremap <leader>w :pc<CR>

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" Jedi configuration
" remap the rename command to use capital R
" let g:jedi#rename_command = "<leader>R"

" Make Supertab and Jedi work well togeter
"set omnifunc=jedi#completions
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Another experiment trying to run python code from within vim without using
" Tmux
":let mapleader = '\'
"autocmd FileType python let b:dispatch = 'python %'
"map <leader>q :w<CR> :Dispatch<CR>

" This section for using Python,IPython and Tmux
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
" This is Brazil specific. Depends on BrazilPython2 generating the runpy script
" - use brazil-build release to generate this from your Brazil python project
"   See https://w.amazon.com/index.php/BrazilPython2 for details on
"   BrazilPython2 projects
" map <F5> :ScreenShellVertical ./runpy<CR> :sleep 4<CR> :call ScreenShellSend("%load_ext autoreload")<CR> :call ScreenShellSend("%autoreload 2")<CR>
map <F5> :ScreenShellVertical<CR>
"map <F6> :ScreenShellVertical ./runpy<CR> :sleep 1<CR> :call ScreenShellSend("%load_ext autoreload")<CR> :call ScreenShellSend("%autoreload 2")<CR> :call sCReenShellSend("import pytest")<CR>
""map <F6> :call ScreenShellSend("%load_ext autoreload")<CR> sleep 2<CR> :call ScreenShellSend("%autoreload 2")<CR>

"nnoremap <leader>f :w<CR> :call ScreenShellSend("python " .@%)<CR>
" For python2
"nnoremap <leader>b :w<CR> :call ScreenShellSend("execfile('".@%."')")<CR>
" For python3
"nnoremap <leader>b :w<CR> :call ScreenShellSend("exec(open('".@%."').read())")<CR>
" Using ipython
"nnoremap <leader>r :w<CR> :call ScreenShellSend("%run "  .@%) <CR>
"nnoremap <leader>r :w<CR> :call ScreenShellSend("%run -m pytest "  .@%) <CR>
"nnoremap <leader>r :w<CR> :call ScreenShellSend("./runpy -cmd "python setup.py nosetests --tests " .  .@% . "'") <CR>
"nnoremap <leader>r :w<CR> :PymodeLintAuto<CR> :call ScreenShellSend("./runpy -cmd 'python setup.py nosetests --verbosity=2 --tests " .@% . "'")<CR>

" runpy mapping to run tests using runpy - had mixed results with this
"nnoremap <leader>r :w<CR> :PymodeLintAuto<CR> :call ScreenShellSend("./runpy -cmd 'python setup.py nosetests --verbosity=2 --tests " .@% . ":" . cfi#format("%s","")  . "'")<CR>

" brazil-test-exec mapping
" nnoremap <leader>t :w<CR> :PymodeLintAuto<CR> :call ScreenShellSend("brazil-test-exec python2.7 -m py.test -q -s " .@% . "::" . cfi#format("%s","") . " --capture=no")<CR>

" nnoremap <leader>r :w<CR> :call ScreenShellSend("%run "  .@%) <CR>
" nnoremap <leader>t :w<CR> :call ScreenShellSend("./runpy -m nose.core " .@% . ":" . cfi#format("%s","") . " --verbose --nocapture --nologcapture")<CR><CR>
" " map <F6> :call ScreenShellSend("/apollo/bin/env" :call system(brazil-bootstrap)  "/bin/python")<CR>
" map <F6> :call ScreenShellSend(LaunchBrazilPyShell())<CR>
" function! LaunchBrazilPyShell()
"         let bootstrap = system("$(brazil-bootstrap)")
"         "let stripped_bs = substitute(bootstrap, '^\s*\(.\{-}\)\s*$', '\1', '')
"         let cmd = printf("\/apollo\/bin\/env %s%s",bootstrap, "\/bin\/python")
"         return cmd
" endfunction

nnoremap <leader>a :A<CR>
nnoremap <leader>t :TagbarToggle<CR>

set cursorline
set exrc
set secure


" Setup Silver Searcher for ack vim:
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" nnoremap <leader>s :Ack " .@z. "<CR> 
nnoremap <leader>s :Ack <cword><CR> 

" C settings
" YouCompleteMe config
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"
nnoremap <leader>m :w<CR>:Make -C build<CR>


"ctags enable for function and symbol jumping
set tags=tags

"added for simple exercise with git.  remove later..
