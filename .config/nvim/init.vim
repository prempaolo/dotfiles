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

set clipboard+=unnamedplus
let g:airline_theme='bubblegum'

let mapleader =" "

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>x :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
map <leader>o :!opout <c-r>%<CR><CR>

filetype indent on
syntax on
set background=dark
colorscheme gruvbox
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

" Make split behave like wm
set splitright
set splitbelow

" Smooth scrolling plugin
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" Minimap plugin
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 0
let g:minimap_close_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf']
nnoremap <leader>m :MinimapToggle<CR>

" NerdTree plugin
nnoremap <C-n> :NERDTreeToggle<CR>

" CoC NVIM plugin
" Sets the Tab key to work properly
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Sets the Enter key to work properly
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Telescope plugin
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Split screen and select new file with Treescope
map <leader>b :split<cr><cmd>Telescope find_files<cr>
map <leader>v :vsplit<cr><cmd>Telescope find_files<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'https://github.com/vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'gabrielelana/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'unblevable/quick-scope'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-smooth-scroll'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'wfxr/minimap.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" Use {Visual}["+]gr to replace the selection with the content of clipboard
Plug 'inkarkat/vim-ReplaceWithRegister'

call plug#end()
