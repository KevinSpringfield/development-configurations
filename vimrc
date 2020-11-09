set nocompatible              " be iMproved, required
"filetype off                  " required
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
" enable syntax highlighting
syntax enable

" show line numbers
set number

" highlight search results
set hlsearch
"set incsearch

" set tabs to have 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set bs=2

" list empty char
"set list
"set listchars=tab:▹\ ,trail:▵

" set folder
set nofoldenable
set foldmethod=indent
set foldnestmax=1  " only fold the top level

" dark theme
"set background=dark

" enable cursor
set cursorline
" set cursorcolumn

" mouse scroll
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" set encoder to utf8。
set enc=utf8

" set vsp to right
set splitright

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
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" set vim-airline theme
"let g:airline_theme='tomorrow'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=0
let g:airline#extensions#tabline#fnamemod = ':t'

"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
endfunction

"call NERDTreeHighlightFile('py', 'yellow', 'none', '#F09F17', '#151515')
"call NERDTreeHighlightFile('pyc', 'darkgray', 'none', '#8c8c8c', '#151515')


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Themes
" Plugin 'mhartington/oceanic-next'
" Plugin 'lifepillar/vim-solarized8'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'haishanh/night-owl.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Utils
Plugin 'kevinw/pyflakes-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'

" IDE
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mileszs/ack.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdtree'


call vundle#end()            " required
filetype plugin indent on    " required

" setup for ocenaicnext
"colorscheme OceanicNext

" setup for solarized theme
" let g:solarized_use16 = 1
" set background=dark
" colorscheme solarized8_flat

" setup scheme night owl
"colorscheme night-owl

" setup for gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
let g:gruvbox_italic=1


" setup vim one
"colorscheme one
"set background=dark

" colorscheme nord

" setup for indentLine
let g:indentLine_char = '┆'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '-'
let g:indentLine_color_gui = '#4B4E55'

" setup for jedi
let g:jedi#use_tabs_not_buffers = 1

" setup for gitgurrer
set signcolumn=yes
"let g:gitgutter_enabled = 1

" setup coc
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
let g:coc_disable_startup_warning = 1

" GoTo code navigation.
"nmap <silent> gd :<C-u>call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Shortcut for diagnostic
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"if exists('+termguicolors')
"  set termguicolors
"endif

"
" To ignore plugin indent changes, instead use: " filetype plugin on
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

nmap <Leader>f :FZF<CR>
nmap <Leader>i :IndentLinesToggle<CR>

" map for tab control
nnoremap <C-t> :tabnew<Space><CR>
inoremap <C-t> <Esc>:tabnew<Space><CR>
nnoremap <S-h> gT
nnoremap <S-l> gt

" map for autocomplete selection
"inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"map for nerdtree
map <C-n> :NERDTreeToggle<CR>

"coc auto compelete remap <TAB>
"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()


