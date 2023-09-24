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
set nobackup
let mapleader=","
nnoremap <silent> <Leader>s <ESC>/\v $<CR> " trailing space
nnoremap <silent> <Leader>l :windo :set scb!<CR> " scroll lock
nnoremap <silent> <Leader>w :set wrap!<CR> " word wrap
nnoremap <silent> <leader>c <ESC>/\v^[<=>]{7}( .*\|$)<CR> " version control conflicts
nnoremap <silent> <leader>d <ESC>/\vdiff --git.*<CR> " git diff
nnoremap <silent> <leader>o <ESC>/\vSysprint data set<CR> " Job output delim
nnoremap <silent> <leader>e <ESC>/\verror \w<CR> " compile errors
nnoremap <silent> <leader>tt <ESC>/\v\[Todo\].*<CR> " todo list
nnoremap <silent> <leader>tp <ESC>/\v\[Prog\].*<CR> " todo list
nnoremap <silent> <leader>td <ESC>/\v\[Done\].*<CR> " todo list
" File history query
nnoremap <leader>h :browse filter // ol<left><left><left><left>
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
