set encoding=utf-8
set noswapfile
set number
set relativenumber
set scrolloff=8
set colorcolumn=90
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set wildignore+=*/tmp/*,*/dist/*,*/node_modules/*,*.so,*.swp,*.zip,package-lock.json

" show existing tab with 2 spaces width
 set tabstop=2
 " when indenting with '>', use 2 spaces width
 set shiftwidth=2
 " On pressing tab, insert 2 spaces
  set expandtab

  call plug#begin('~/.config/nvim/plugged')

 "  Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Keeping up to date with master
  Plug 'neoclide/coc.nvim', {'do': 'npm install --frozen-lockfile'}


  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ryanoasis/vim-devicons'

  " Automatic close parens
  Plug 'jiangmiao/auto-pairs'

  " Colorscheme
   Plug 'morhetz/gruvbox'
   Plug 'crusoexia/vim-monokai'
   Plug 'jacoborus/tender.vim'
   Plug 'NLKNguyen/papercolor-theme'

  " Emmet
   Plug 'mattn/emmet-vim'
" highlight colors
   "Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " css3 syntax highlight
   Plug 'hail2u/vim-css3-syntax'

  " Syntax hightlight for .js
   Plug 'pangloss/vim-javascript'

  " Syntax highlight for .ts
   Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

  " Syntax highlight for .tsx
   Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }

  " Syntax hightlight for Vue.js
   Plug 'posva/vim-vue'

   "Plug 'iamcco/coc-angular', {'branch': 'release'}
   Plug 'airblade/vim-gitgutter'

   " Syntax hightlight for .jsx
   Plug 'mxw/vim-jsx'

   "Commenting
   Plug 'preservim/nerdcommenter'

   "Airline
   Plug 'vim-airline/vim-airline'

   "Tailwindcss
   Plug 'iamcco/coc-tailwindcss',  {'do': 'npm install --frozen-lockfile && npm run build'}

   "Grahql
   Plug 'jparise/vim-graphql'

   call plug#end()

  "for tender If you have vim >=8.0 or Neovim >= 0.1.5
  "if (has("termguicolors"))
    "set termguicolors
  "endif

  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors

   syntax on
   colorscheme PaperColor "tender "monokai "gruvbox


   " set lighline theme inside lightline config
   let g:lightline = { 'colorscheme': 'tender' }

   filetype plugin indent on

   let g:NERDTreeWinPos = "right"
   let g:NERDTreeIgnore = ['^node_modules$']

   let g:ctrlp_use_caching = 0
   let g:ctrlp_working_path_mode = 0
   let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
   let g:ctrlp_custom_ignore = 'node_modules\|dist\'

   " coc config
   let g:coc_global_extensions = [
     \ 'coc-snippets',
     \ 'coc-pairs',
     \ 'coc-tsserver',
     \ 'coc-eslint',
     \ 'coc-prettier',
     \ 'coc-json',
     \ 'coc-html',
     \ 'coc-css',
     \ 'coc-vetur',
     \ ]

   "mappings
   map <C-n> :NERDTreeToggle<CR>

   "block Ctrl + Z
   nnoremap <c-z> <nop>

   "block arrows
   noremap <Up> <Nop>
   noremap <Down> <Nop>
   noremap <Left> <Nop>
   noremap <Right> <Nop>

   "block mouse coursor
   set mouse=

   "Insert a newline without entering in insert mode, vim
   nmap oo o<Esc>k
   nmap OO O<Esc>j

   "CTRL + S to save
   nmap <c-s> :w<CR>
   vmap <c-s> <Esc><c-s>gv
   imap <c-s> <Esc><c-s>

   "CTRL + Z to undo
   nnoremap <c-z> :u<CR>      " Avoid using this**
   inoremap <c-z> <c-o>:u<CR>nmap <F2> :update<CR>
   vmap <F2> <Esc><F2>gv
   imap <F2> <c-o><F2>

   noremap <F3> :set invnumber<CR>
   inoremap <F3> <C-O>:set invnumber<CR>

   nmap <silent> gd <Plug>(coc-definition)

   inoremap jk <esc>

   " Use `:ORGANIZE` for organize import of current buffer
   command! -nargs=0 ORGANIZE :call CocAction('runCommand', 'tsserver.organizeImports')

   " Use `:Prettier` command for coc
   command! -nargs=0 Prettier :CocCommand prettier.formatFile

   " Use `:Format` to format current buffer
   command! -nargs=0 Format :call CocAction('format')

   " Pre Save
   autocmd BufWritePre *.js :ORGANIZE
   autocmd BufWritePre *.ts :ORGANIZE

   "config emmet
   let g:user_emmet_leader_key='<C-x>'
   
   
"config
  "terminal----------------------------------------------------------
  "-----------------------------------------------------------
  set splitright
  set splitbelow

  "turn terminal to normal mode wih escape
  tnoremap <Esc> <C-\><C-t>

  "start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif

  "open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction

  nnoremap <c-t> :call OpenTerminal()<CR>

   

