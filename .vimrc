autocmd BufNewFile,BufRead *.vue setfiletype vue
" insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
nnoremap <expr> gr ':Rgrep<CR>'
let g:neocomplcache_enable_at_startup = 1
let g:go_fmt_command="goimports"
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_keepdir=0
let g:netrw_banner = 0
let g:solarized_termcolors=256
let mapleader = "\<Space>"
tnoremap gt <C-w>:tabNext <cr>
tnoremap gT <C-w>:tabNext <cr>
tnoremap gn <C-w>:tabnew <cr>
nnoremap gn :tabnew <cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <C-n> :Ex<CR>
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :wa<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>b :Denite buffer file_mru<cr>
vnoremap <leader>y "+y<cr>

nnoremap <leader>on :if exists("g:syntax_on") <Bar>
      \ syntax off <Bar>
      \ else <Bar>
      \ syntax enable <Bar>
      \ endif <CR>

nnoremap j gj
nnoremap k gk
noremap <leader>n :bn<CR>
noremap <leader>p :bp<CR>
runtime macros/matchit.vim
set lazyredraw
set ttyfast
set bs=start
set autoread
set background=dark
set enc=utf8
set expandtab
set fenc=utf-8
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set nobackup
set noswapfile
set shiftwidth=2
set showcmd
set tabstop=2
set virtualedit=onemore
set visualbell
set wildmenu
set wildmode=full
set wrapscan
set wrap
set updatetime=100
" オムニ補完の設定（insertモードでCtrl+oで候補を出す、Ctrl+n
" Ctrl+pで選択、Ctrl+yで確定）
set omnifunc=pythoncomplete#Complete
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=xmlcomplete#CompleteTags
set omnifunc=phpcomplete#CompletePHP

tnoremap <silent> jj <C-\><C-n>
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set laststatus=2 " ステータスラインを常に表示

let &statusline = ''
let &statusline .= '%t'
let &statusline .= '%='
let &statusline .= '[%{&l:fileencoding == "" ? &encoding : &l:fileencoding}%Y]' 
let &statusline .= ' %-5.(%l,%c%V%) %P'

let loaded_matchparen = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-z>"


call plug#begin('~/.vim/plugged')
"[count]<leader>c<space> |NERDComToggleComment|
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neobundle.vim'
Plug 'joshdick/onedark.vim'
Plug 'slim-template/vim-slim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
call plug#end()
colorscheme onedark
syntax enable

set scrolloff=16
hi Search ctermbg=DarkGreen

