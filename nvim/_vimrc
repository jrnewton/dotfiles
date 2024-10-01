set encoding=UTF-8
set autochdir " for older vims: autocmd BufEnter * silent! :lcd %:p:h
set hidden " Hide buffers rather than unloading it
filetype indent on
filetype plugin on
syntax on
set backspace=indent,eol,start
set clipboard=unnamed " get yank to work with system clipboard
set expandtab
set shiftwidth=2
set tabstop=2
set wildignorecase
set wildmenu
set number
"So far I haven't used this as much as I thought...
"set relativenumber
set guioptions+=bk " b=enable bottom scroll, k=keep window size
set synmaxcol=512 " stop syntax highlight, avoid slow down on long lines
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2 " always show status line
set ignorecase
set incsearch
set hlsearch
set nowrapscan
set nowrap
set nobackup
set nocursorline
set nospell
set colorcolumn=80
set scrolloff=20
set guicursor=a:blinkon100
let mapleader="\\"
" Make sure nothing is after <CR> or mapping will be messed up.
" wrap
nnoremap <silent> <Leader>w :set wrap!<CR>
" trailing Space
nnoremap <silent> <Leader>s <ESC>/\v $<CR>
" Diffthis!
" nnoremap <silent> <Leader>d :windo :diffthis<CR>
" scroll Lock
nnoremap <silent> <Leader>l :windo :set scb!<CR>
" Conflicts
nnoremap <silent> <leader>c <ESC>/\v^[<=>]{7}( .*\|$)<CR>
" Format visual selection with 'gq' which applies textwidth
vnoremap <silent> <leader>f gq<CR>
" git Patch
nnoremap <silent> <leader>p <ESC>/\vdiff --git.*<CR>
" jes job Output delim
nnoremap <silent> <leader>o <ESC>/\vSysprint data set<CR>
" compile Errors
nnoremap <silent> <leader>e <ESC>/\verror \w<CR>
" Todo list
nnoremap <silent> <leader>tt <ESC>/\v\[Todo\].*<CR>
nnoremap <silent> <leader>tp <ESC>/\v\[Prog\].*<CR>
nnoremap <silent> <leader>td <ESC>/\v\[Done\].*<CR>
" Buffer navigation
nnoremap <silent> <leader>] :bn<CR>
nnoremap <silent> <leader>[ :bp<CR>
" file History query
nnoremap <leader>h :browse filter // ol<left><left><left><left>
tnoremap <Esc> <C-\><C-n>
