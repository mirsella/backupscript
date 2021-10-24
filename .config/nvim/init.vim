call plug#begin('~/.config/nvim/plugged')
Plug 'nathom/filetype.nvim'
Plug 'dpelle/vim-LanguageTool'
Plug 'vim-scripts/argtextobj.vim'
Plug 'udalov/kotlin-vim'
Plug 'sophacles/vim-processing'
Plug 'plasticboy/vim-markdown'
Plug 'honza/vim-snippets'
Plug 'posva/vim-vue'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'chr4/nginx.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'phaazon/hop.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'markonm/traces.vim'
Plug 'chaoren/vim-wordmotion'
" Plug 'mirsella/nerdcommenter' " fork support for custom nerd-leaderkey (default = c )
Plug 'tyru/caw.vim' " only one who work with vue and ↙
Plug 'suy/vim-context-commentstring'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf.vim'
Plug 'mirsella/otherbufdo.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'machakann/vim-highlightedyank'
Plug 'decayofmind/vim-lightline-functions'
Plug 'terryma/vim-multiple-cursors'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'metakirby5/codi.vim'
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
Plug 'j5shi/CommandlineComplete.vim'
Plug 'Raimondi/delimitMate'
Plug 'nicwest/vim-camelsnek'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
" Plug 'sheerun/vim-polyglot' " install vim-javascript which break rainbow parentheses
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/vim-slash'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'anott03/nvim-lspinstall'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
" Plug 'fannheyward/coc-xml', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile'}
" Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/jsonc.vim'
call plug#end()

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! -nargs=? CC :CocCommand
command! -nargs=+ Zoom :set guifont=monospace:h<args>
command! -nargs=? V :vert sb
command! FR :setlocal spell spelllang=fr
command! Cdfile :lcd %:p:h
command! Curl :r !curl -s $(xclip -out -selection clipboard)<cr>
map <Space> <Leader>
inoremap jj <Esc>
inoremap kk <Esc>:wa<cr>a
map Y y$
nnoremap U :echo " < < ===== C H E C K   C A P S   L O C K ===== > > "<CR>
nnoremap d" dt"
nnoremap d' dt'
inoremap <C-H> <C-W>
nnoremap <M-F1> <nop>
xnoremap <M-F1> <nop>
inoremap <M-F1> <nop>
nnoremap ' `
nnoremap <leader>O :Files<Space>
nnoremap <leader>o :Files /home/mirsella<CR>
nnoremap <leader>: :noh<cr>

nnoremap <F1> :wa<cr>
xnoremap <F1> :wa<cr>
inoremap <F1> <esc>:wa<cr>a
nnoremap <F2> :bw!
xnoremap <F2> :bw!
nnoremap <F3> :wa <bar> :bw<cr>
xnoremap <F3> :wa <bar> :bw<cr>
nnoremap <F4> :Filetypes<cr>
xnoremap <F4> :Filetypes<cr>

nnoremap <F5> :vsplit<cr>
nnoremap <F5> :vsplit<cr>
nnoremap <F6> :vert sb 
xnoremap <F6> :vert sb 

nnoremap <F7> :set wrap<cr>
xnoremap <F7> :set wrap<cr>
nnoremap <F8> :set nowrap<cr>
xnoremap <F8> :set nowrap<cr>

" hop.nvim
nmap <leader>/ :HopPattern<cr>
nmap <Leader>f :HopChar1<cr>
nmap <leader>g :HopChar2<cr>
nmap <Leader>l :HopLine<cr>
nmap <Leader>w :HopWord<cr>

" lightspeed
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
nmap <leader>j <Plug>Lightspeed_s
nmap <leader>k <Plug>Lightspeed_S

nnoremap <C-j> 5jzz
nnoremap <C-k> 5kzz
xnoremap <C-j> 5jzz
xnoremap <C-k> 5kzz
nnoremap <C-l> :bnext<CR>
inoremap <C-l> <esc>:bnext<CR>
nnoremap <C-h> :bprev<CR>
inoremap <C-h> <esc>:bprev<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nmap <Leader>& <Plug>lightline#bufferline#go(1)
nmap <Leader>é <Plug>lightline#bufferline#go(2)
nmap <Leader>" <Plug>lightline#bufferline#go(3)
nmap <Leader>' <Plug>lightline#bufferline#go(4)
nmap <Leader>( <Plug>lightline#bufferline#go(5)
nmap <Leader>- <Plug>lightline#bufferline#go(6)
nmap <Leader>è <Plug>lightline#bufferline#go(7)
nmap <Leader>_ <Plug>lightline#bufferline#go(8)
nmap <Leader>ç <Plug>lightline#bufferline#go(9)
nmap <Leader>à <Plug>lightline#bufferline#go(10)

" plug yoink, cutlass & subversive
nmap <leader>n <plug>(YoinkPostPasteSwapBack)
nmap <leader>p <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nnoremap <leader>c c
xnoremap <leader>c c
nnoremap <leader>cc cc
nnoremap <leader>C C

nnoremap <leader>s s
xnoremap <leader>s s
nnoremap <leader>S S

nnoremap <leader>d d
xnoremap <leader>d d
nnoremap <leader>dd dd
nnoremap <leader>D D

nnoremap <leader>x x
nnoremap <leader>X X

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" completion menu
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Tab>      pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

filetype plugin on
filetype indent on
set nocompatible
" set formatoptions-=ro
augroup formatoptions
  autocmd FileType * set formatoptions-=ro
augroup END
au BufNewFile,BufRead *.html set filetype=html " html file set itself to django, weird
set nowrap
set linebreak
set ignorecase " use \C in regex to search case sensitive
set noerrorbells
set hidden
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set noswapfile
set wildignorecase
set scrolloff=3
set history=1000
set mouse=a
set clipboard=unnamedplus
set lazyredraw
set splitbelow splitright
set incsearch
set encoding=UTF-8
set termguicolors
set updatetime=300
set shortmess+=c
set completeopt=longest,menuone
" au BufEnter * set noro
set noro
set isfname+={,}
set number relativenumber

" themes
colorscheme gruvbox
highlight Normal guibg=NONE
highlight LineNr guifg=#7b6e63 guibg=NONE
highlight CursorLineNr guifg=#f7bd2f guibg=NONE
" pink ↓
" highlight LineNr guifg=#f796ef guibg=NONE
" highlight CursorLineNr guifg=#f796ef guibg=NONE

" less mess
set backup backupdir=~/.cache/nvim/backup
set dir=~/.cache/nvim/swap
set undofile undodir=~/.cache/nvim/undo
let g:netrw_dirhistmax = 0

" lightline
source ~/.config/nvim/lightlinerc.vim
set laststatus=2
set noshowmode
function! LineCurrentOnTotal()
  return '↕'.line('.').'/'.line('$')
endfunction
function! ColCurrentOnTotal()
  return '↔'.col('.').'/'.col('$')
endfunction
function! LineCol()
  return '↕'.line('.').'/'.line('$').' : ↔'.col('.').'/'.col('$')
endfunction
function! GitBranch()
  if (gitbranch#name() != "")
    return ''.' '.gitbranch#name()
  else
    return ''
  endif
endfunction

" lightline-bufferline
set showtabline=2
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#show_number = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDLeaderKey = 'v'

" codi
let g:codi#autoclose = 1

" emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_leader_key=','

" yoink
let g:yoinkIncludeDeleteOperations=1
let g:yoinkSavePersistently=1
let g:yoinkAutoFormatPaste=1
let g:yoinkSwapClampAtEnds=1
let g:yoinkIncludeNamedRegisters=1
let g:yoinkSyncSystemClipboardOnFocus=1
let g:yoinkSavePersistently=1
let g:yoinkIncludeDeleteOperations=1

" firenvim
let g:firenvim_config = { 
      \ 'globalSettings': {
      \ 'alt': 'all',
      \  },
      \ 'localSettings': {
      \ '.*': { 'cmdline': 'neovim',  'priority': 0,  'selector': 'textarea',  'takeover': 'never' },
      \ }
      \ }

" command line complete
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

" highlightedyank
let g:highlightedyank_highlight_duration = 200

" caw.vim
map gr <Plug>(caw:hatpos:comment)
map gt <Plug>(caw:hatpos:uncomment)
" map gt <Plug>(caw:hatpos:toggle)

" fold settings
set foldmethod=syntax
" set nofoldenable
set foldlevel=99
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" RainbowParentheses
let g:rainbow_active = 1

" hop.nvim
lua << EOF
require('hop').setup({create_hl_autocmd = true})
EOF

" -- Do not source the default filetype.vim
let g:did_load_filetypes = 1
