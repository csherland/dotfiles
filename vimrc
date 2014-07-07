"
"	Christian Sherland
"	    .vimrc
"
"

" Handle some basic stuff to enable plugins
set nocompatible
syntax on
filetype off

" Setting up Vundle - the vim plugin bundler
let hasVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let hasVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'

" ...All your other bundles...
if hasVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

filetype plugin indent on

" Better color stuff
set background=dark
colorscheme solarized

" Map leader to comma
let mapleader=","

" No folding
set nofoldenable

" Fix wrapping behavior when moving
nmap j gj
nmap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Moving between buffers
nmap <C-e> :bnext<CR>
nmap <C-w> :bprev<CR>
nmap <C-x> :bd<CR>

" Options dealing with search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Show the 80th column
set colorcolumn=80

" Default encoding
set encoding=utf-8

" Highlight current line
set cursorline

" For switching between buffers without saving
set hidden

" Clear the search buffer
nmap <silent> ,/ :nohlsearch<CR>

" Show command in bottom bar
set showcmd

" Visual autocomplete for command menu
set wildmenu

" Line numbers
set number

" Some editing preferences (tabs,  etc)
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set showmatch
set smarttab

" Set information on history
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" Terminal setting
set title
set visualbell
set noerrorbells

" Dont allow vim to make backups
set nobackup
set noswapfile

" INDENTING BLOCKS (retains vis. selection)
vnoremap > >gv
vnoremap < <gv

" Anti-temptation
"ino <Up> <NOP>
"ino <Right> <NOP>
"ino <Down> <NOP>
"ino <Left> <NOP>

" Navigating between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" This will save a lot of time
nnoremap ; :

" Enable the use of the mouse
set mouse=a

" Set the terminals title
set title

" ADD FILE-TYPE
au BufNewFile,BufRead *.mu set filetype=html syntax=mustache
au BufNewFile,BufRead *.json set filetype=javascript

" Forgot to sudo? No problem!
cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Easy mapping to kill trailing whitespace
nmap <silent> <leader>fw :FixWhitespace<CR>

" NERDTree
"nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Syntastic
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
nmap <silent> <leader>stm :SyntasticToggleMode<CR>
let g:syntastic_enable_signs=1
highlight SyntasticErrorSign guifg=white guibg=red

" Airline
set laststatus=2
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
