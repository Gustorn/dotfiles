if has('unix')
  set shell=bash
endif

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neco-vim', {'on_ft': 'vim', 'lazy': 1})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('joshdick/onedark.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('rust-lang/rust.vim')
  call dein#add('neomake/neomake')
  call dein#add('autozimu/LanguageClient-neovim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-repeat')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('cespare/vim-toml')
  call dein#add('maralla/vim-toml-enhance')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('terryma/vim-multiple-cursors')

  if has('unix')
    call dein#add('nixprime/cpsm', { 'build': 'export PY3=ON && ./install.sh' })
  endif

  call dein#end()
  call dein#save_state()
endif

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

let mapleader = "\<Space>"
let g:airline_powerline_fonts = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

if has('unix')
  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
endif

let g:ctrlp_user_command = 'rg --files %s'
let g:deoplete#enable_at_startup=1
let g:airline#extensions#tabline#enabled = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'javascript': ['~/.local/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
  \ 'typescript': ['~/.local/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
  \ }

map <C-n> :NERDTreeToggle<CR>
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
autocmd! BufWritePost * Neomake

