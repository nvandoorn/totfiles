function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugged')

" Pick a theme, any theme, really
Plug 'NLKNguyen/papercolor-theme'
Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Syntax support
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'tsx'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jxnblk/vim-mdx-js'
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'

" Extensions
" Chuch of tpope
Plug 'wellle/targets.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ervandew/supertab'
Plug 'vim-ruby/vim-ruby'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" General config
syntax on
set timeoutlen=1000 ttimeoutlen=0
set bs=2
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
" TODO load this from a file
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*,*/coverage/*,*/.nyc_output/*,*/build/*,*/.cache/*,*/public/*,*/dist/*
filetype plugin on
runtime macros/matchit.vim

" Key bindings
nmap <C-u> [e
nmap <C-d> ]e
vmap <C-u> [egv
vmap <C-d> ]egv
nnoremap ; :
nnoremap : ;
nnoremap : :Ranger<CR>

" Theme
colorscheme $VIM_THEME
let g:airline_powerline_fonts = 1
let g:airline_theme=$VIM_AIRLINE_THEME

let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'rw'

augroup jbuilder
  au!
  autocmd BufNewFile,BufRead *.jbuilder set syntax=ruby
augroup END

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
