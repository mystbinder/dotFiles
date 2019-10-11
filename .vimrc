set nocompatible

set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_ZH=[3m
set t_ZR=[23m
set number

filetype indent plugin on
syntax on

set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase
set autoindent
set laststatus=2
set confirm
set cmdheight=2

set visualbell
set t_vb=

set pyxversion=3

set expandtab
set tabstop=2
set sts=2
set shiftwidth=2

set nowrap
set cursorline

" <space> doesn't really do anything in normal mode in vim
" so we're going to make that the <leader> key
let mapleader="\<Space>"

" [remaps]
inoremap jk <esc>
cnoremap jk <esc>
vnoremap <leader><leader> <esc>
vnoremap C "+y

" remove trailing whitespace
nnoremap rmws :%s/\s\+$//e <cr> <bar> :echo('removed trailing whitespace') <cr>

" better movement
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" ALE movement
nnoremap <leader>an :ALENext <CR>
nnoremap <leader>aN :ALEPrevious <CR>

" gitgutter movement
nnoremap <leader>gn :GitGutterNextHunk <CR>
nnoremap <leader>gN :GitGutterPrevHunk <CR>
nnoremap <leader>gp :GitGutterPreviewHunk <CR>
nnoremap <leader>gu :GitGutterUndoHunk <CR>

" focus nerdtree, this allows up to pick from where we want to split/open
nnoremap <leader>nt :NERDTreeFocus <cr>

call plug#begin()
" [Plugins-General]
" colorscheme
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'

" file tree
Plug 'scrooloose/nerdtree'

" better window swapping
Plug 'wesQ3/vim-windowswap'

" easily change surround characters
Plug 'tpope/vim-surround'

" better statusline
Plug 'vim-airline/vim-airline'

" vim-airline themes
Plug 'vim-airline/vim-airline-themes'

" [Plugins-Dev]
" vim-commentary
Plug 'tpope/vim-commentary'

" unicode searching
Plug 'chrisbra/unicode.vim'

" asynchronous linting engine
Plug 'w0rp/ale'

" git integration
Plug 'tpope/vim-fugitive'

" git/NERDtree integration
Plug 'Xuyuanp/nerdtree-git-plugin'

" git change symbols in the gutter
Plug 'airblade/vim-gitgutter'

" vue
Plug 'posva/vim-vue'

" typescript
Plug 'leafgarland/typescript-vim'

" js
Plug 'pangloss/vim-javascript'

" arduino
Plug 'sudar/vim-arduino-syntax'

" completion engine
Plug 'Valloric/YouCompleteMe'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
set background=dark

" [ ALE ]
let g:ale_fixers = {}
let g:ale_fixers.javascript = [ 'eslint' ]
let g:ale_fixers.typescript = [ 'eslint' ]

" [vim-airline config]
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L : %c'

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

