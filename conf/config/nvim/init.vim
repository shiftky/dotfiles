" ~/.vimrc
" ------------------------------
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set nocompatible
syntax enable

" Plugins
" ------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neocomplete.vim')

call dein#add('yonchu/accelerated-smooth-scroll')

call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-endwise')
call dein#add('slim-template/vim-slim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('cespare/vim-toml')

call dein#end()

" yonchu/accelerated-smooth-scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 5
let g:ac_smooth_scroll_fb_sleep_time_msec = 5

" Shougo/neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'


" dysplay
" ------------------------------
set number
set ruler
set wildmenu
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set statusline=%F%r%h%=


" edit
" ------------------------------
filetype plugin on
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
au FileType go setlocal sw=4 ts=4 sts=4 noet
set incsearch
set backspace=indent,eol,start


" keymap
" ------------------------------
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Space> <C-E>
nnoremap <S-Space> <C-Y>
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap ; :
" wq alias
command! -nargs=0 Wq wq

filetype plugin indent on
