set exrc "when you init with vim with a column (vim ,) to start a project in a folder, Vim will look for a .vimrc within that folder and use it as additional customizations to Vim based on that project.
set relativenumber
set nu " shows number of current line isntead of 0 by 'relativenumber'
set signcolumn=yes
"set nohlsearch
set hidden
set noerrorbells
set conceallevel=2
set noswapfile " disable the swapfile
	
set tabstop=4 softtabstop=4
set shiftwidth=4
"set expandtab
set smartindent

" set working directory according to current buffer
set autochdir acd

set wrap linebreak "softwrap
"set ignorecase
"set ignoresmartcase
set incsearch
set scrolloff=8
" set colorcolumn=80 "display a colored column used as a guide for the number of indentations you do in code

"remap 'exiting Insert mode' to jk:
" inoremap jk <ESC> 

" colo alduin
set number
syntax on

"hi Normal ctermbg=NONE guibg=NONE
"hi EndOfBuffer ctermbg=NONE guibg=NONE
"hi NonText ctermbg=NONE guibg=NONE

"set background=light

set rtp+=~/.fzf " adding fzf to vim

" Vim Splits - Move Faster and More Naturally
" src: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" PLUGINS!!

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Load plugins.
call plug#begin()

"	Plug 'powerline/powerline'
"	Plug 'ap/vim-buftabline'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'gruvbox-community/gruvbox'
	"Plug 'sheerun/vim-polyglot'
	Plug 'mattn/emmet-vim' "possible swap for tpope/vim-ragtag
	"Plug 'jaxbot/semantic-highlight.vim' 
	"Plug 'tpope/vim-surround'
call plug#end()

" vim-airline: Smarter tab line - Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1



colo gruvbox " somehow this needs to be on for proper theming to work with gruvbox-community/gruvbox
hi Normal ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE

" Better statusline as per: https://www.vi-improved.org/recommendations/
" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
