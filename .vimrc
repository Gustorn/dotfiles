set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'maralla/completor.vim'

call plug#end()

filetype plugin indent on
syntax on

set termguicolors
colorscheme onedark

set hidden
set number
set relativenumber
set noshowmode

set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set autoindent
set copyindent
set smartindent
set smarttab
set hlsearch
set incsearch
set showmatch
set title
set nobackup
set noswapfile
set laststatus=2
set linebreak

let mapleader = "\<Space>"
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:ctrlp_user_command = 'rg --files %s'
let g:airline#extensions#tabline#enabled = 1

map <Leader>f :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <C-o> :let g:cpsm_match_empty_query = 0<CR>:CtrlPMRU<CR>
nnoremap <silent> <C-p> :let g:cpsm_match_empty_query = 1<CR>:CtrlP<CR>

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

