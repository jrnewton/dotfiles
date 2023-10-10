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
set cursorline
set guioptions+=bk " b=enable bottom scroll, k=keep window size
set synmaxcol=512 " stop syntax highlight, avoid slow down on long lines
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2 " always show status line
set encoding=utf-8
set ignorecase
set incsearch
set hlsearch
set nowrapscan
set nowrap
set nobackup
if &term=~'win32' " cmd.exe - make as plain as possible
  colo default
  syntax off
  set nospell
  set nocursorline
elseif &term =~ 'xterm' " linux
  colo koehler
  set nocursorline
else " assume gvim
  colo peachpuff
  set guifont=courier_new:h12
endif
set tw=72
" let mapleader=","
" Make sure nothing is after <CR> or mapping will be messed up.
" wrap
nnoremap <silent> <Leader>w :set wrap!<CR>
" trailing space
nnoremap <silent> <Leader>s <ESC>/\v $<CR>
" scroll lock
nnoremap <silent> <Leader>l :windo :set scb!<CR>
" version control conflicts
nnoremap <silent> <leader>c <ESC>/\v^[<=>]{7}( .*\|$)<CR>
" format visual selection with 'gq' which applies textwidth
vnoremap <silent> <leader>f gq<CR>
" git diff
nnoremap <silent> <leader>d <ESC>/\vdiff --git.*<CR>
" JES job output delim
nnoremap <silent> <leader>o <ESC>/\vSysprint data set<CR>
" compile errors
nnoremap <silent> <leader>e <ESC>/\verror \w<CR>
" todo list
nnoremap <silent> <leader>tt <ESC>/\v\[Todo\].*<CR>
nnoremap <silent> <leader>tp <ESC>/\v\[Prog\].*<CR>
nnoremap <silent> <leader>td <ESC>/\v\[Done\].*<CR>
" buffers
nnoremap <silent> <leader>] :bn<CR>
nnoremap <silent> <leader>[ :bp<CR>
" File history query
nnoremap <leader>h :browse filter // ol<left><left><left><left>
