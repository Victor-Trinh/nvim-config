let mapleader = " "  
" tab config 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" auto closing delimiter
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" line numbers
set relativenumber
set nu
set guicursor=
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" persistent stuff 
set hidden
set noswapfile
set undodir=~/.vim/undodir
set undofile 
set autoread
if has("autocmd") " jump to last position when reopening file 
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" PLUGINS 
call plug#begin('~/.vim/plugged/')
Plug 'gruvbox-community/gruvbox'
" Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
" use coc-clangd for cpp
" may need to do this https://github.com/clangd/coc-clangd/issues/74
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

nnoremap<C-P> :FZF<CR>

" NerdTree
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
nnoremap <C-t> :NERDTreeToggle<CR>

" Treesitter"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF




















