function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.local/share/nvim/plugged')

" Pick a theme, any theme, really
Plug 'mhartington/oceanic-next'
Plug 'NLKNguyen/papercolor-theme'
Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/deoplete.nvim'
Plug 'sbdchd/neoformat'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

set tabstop=2
set foldmethod=syntax
set foldlevelstart=99
set expandtab
set shiftwidth=2
set softtabstop=2
set ai
set number
set relativenumber
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*,*/coverage/*,*/.nyc_output/*,*/build/*,*/.cache/*,*/public/*,*/dist/*
nmap <C-u> [e
nmap <C-d> ]e
vmap <C-u> [egv
vmap <C-d> ]egv
nnoremap ; :
nnoremap : ;

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme $VIM_THEME
let g:airline_theme=$VIM_AIRLINE_THEME
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1
let g:ctrlp_working_path_mode = 'rw'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
