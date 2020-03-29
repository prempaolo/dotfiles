"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

set rnu
set mouse=a
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set laststatus=2
set lazyredraw
set t_Co=256

let mapleader =" "

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>x :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
map <leader>o :!opout <c-r>%<CR><CR>

" Plays music with timidity
map <leader>p :!musicplay <c-r>%<CR><CR>

filetype indent on
syntax on
set background=dark
colorscheme gruvbox
map <C-n> :NERDTreeToggle<CR>
command Pdf w | Pandoc pdf
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Custom highlight colors for quickscope
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'gabrielelana/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'unblevable/quick-scope'

call plug#end()
