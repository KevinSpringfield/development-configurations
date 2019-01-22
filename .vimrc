set nocompatible              " be iMproved, required
filetype off                  " required
" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
" set tabstop=4
" set shiftwidth=4
" set expandtab
set et sw=4 ts=4

" dark theme
set background=dark

" enable cursor
set cursorline
" set cursorcolumn

" set encoder to utf8。
set enc=utf8

" for vim 7
set t_Co=256

" disable beep sound
set noeb

" copy to clipboard
set clipboard=unnamed

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'lifepillar/vim-solarized8'

call vundle#end()            " required
filetype plugin indent on    " required
"colorscheme OceanicNext
let g:solarized_use16 = 1
colorscheme solarized8_dark

" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Auto paste mode
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
