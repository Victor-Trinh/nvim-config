let mapleader = ","    
" tab config 
" - tab size is auto set by vim-sleuth
set expandtab
set smartindent

" line numbers
set relativenumber
set nu
set guicursor=
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
" Give more space for displaying messages.
set cmdheight=2
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
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
" use coc-clangd for cpp
" may need to do this https://github.com/clangd/coc-clangd/issues/74
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" ctrlp fuzzy find
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 'ra'

" NerdTree 
" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
nnoremap <C-t> :NERDTreeToggle <CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1


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

" buftabline"
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" coc config
let g:coc_global_extensions = [
 \ 'coc-tsserver',
 \ 'coc-python',
 \ 'coc-json', 
 \ 'coc-clangd',
 \ 'coc-pairs'
 \ ]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1







