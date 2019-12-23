set nocompatible              " be iMproved, required
filetype off                  " required
" enable syntax highlighting
syntax enable

" show line numbers
set number

" highlight search results
set hlsearch
"set incsearch

" set tabs to have 4 spaces
:set tabstop=4
:set shiftwidth=4
:set expandtab
set bs=2

" list empty char
"set list
"set listchars=tab:▹\ ,trail:▵

" set folder
set nofoldenable
set foldmethod=indent

" dark theme
"set background=dark

" enable cursor
set cursorline
" set cursorcolumn

" mouse scroll
set mouse=a

" set encoder to utf8。
set enc=utf8

" for vim 7
"set t_Co=256

" disable beep sound
set noeb

" copy to clipboard
set clipboard=unnamed

" for vim-vue
set ft=vue

" set indent line
set list lcs=tab:\|\
set list

" enable fzf for vim
set rtp+=~/.fzf

" Set vim-airline theme
let g:airline_theme='solarized'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Plugin 'mhartington/oceanic-next'
" Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required
filetype plugin indent on    " required
"colorscheme OceanicNext

" setup for solarized
" let g:solarized_use16 = 1
" set background=dark
" colorscheme solarized8_flat

" setup for gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set background=dark

" setup for indentLine
let g:indentLine_char = '┆'

" setup for gitgurrer
"let g:gitgutter_enabled = 1

" To ignore plugin indent changes, instead use:
" filetype plugin on
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

highlight ExtraWhitespace ctermbg=darkcyan guibg=yellow
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif

" set leader key and shortcut
let mapleader = "\<space>"

nmap <Leader>pl <insert>from pinkoi.base.qlog import log<CR>log(">>> ", <esc>
nmap <Leader>f :FZF<CR>
nmap <Leader>i :IndentLinesToggle<CR>


