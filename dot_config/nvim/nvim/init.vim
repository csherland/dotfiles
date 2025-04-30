" 
" Neovim config
"

" Use vim - no vi defaults
set nocompatible

" Better color stuff
syntax enable
set background=dark

" Time savers
let mapleader=","
nnoremap ; :
inoremap <leader>\ <esc>

" set visualbell

" Fix wrapping behavior when moving
nmap j gj
nmap k gk

" Moving between buffers
nmap <C-m> :bnext<CR>
nmap <C-b> :bprev<CR>
nmap <C-x> :bp<cr>:bd #<cr>
set hidden  " Switch buffers without saving

" Options dealing with search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>

" Location highlighting
set colorcolumn=100
set cursorline
set ruler           " Column number
set encoding=utf-8  " Default UTF-8 encoding

" Turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Redraw only when necessary
set lazyredraw

" Show command in bottom bar
set showcmd
set wildmenu

" Some editing preferences (tabs,  etc)
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set showmatch
set smarttab

" Code folding
set foldenable
set foldlevelstart=4
set foldmethod=indent

" space opens/closes folds
nnoremap <space> za 	 

" highlight last inserted text
nnoremap gV `[v`]

" Copy to clipboard
map <C-c> "+y<CR>

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

" Navigating between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move to start/end of line
nnoremap B ^
nnoremap E $

" Enable the use of the mouse
set mouse=a

" Add file-type specific options
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.css set synmaxcol=120
au BufEnter *.css set nowrap

" Forgot to sudo? No problem!
cmap w!! w !sudo tee % >/dev/null

" Easy mapping to kill trailing whitespace
nmap <silent> <leader>fw :FixWhitespace<CR>
