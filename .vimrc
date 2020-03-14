"#####dein設定#####
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体がインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" NERDTreeの自動起動（ファイル名指定時にはNERDTreeを表示しない）
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Ctrl + n で 起動/終了
nnoremap <C-n> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead *.vue setfiletype vue

" カーソル移動
inoremap <C-a> <Home>
nnoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <C-e> <End>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>

let g:neocomplcache_enable_at_startup = 2
let g:go_fmt_command="goimports"
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_keepdir=0
let g:netrw_banner = 0
let g:solarized_termcolors=256
let mapleader = "\<Space>"

runtime macros/matchit.vim

set lazyredraw
set ttyfast " ターミナル接続を高速化
set bs=start
set background=dark
set number
set enc=utf8
set fenc=utf-8

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅

set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread "外部でファイルに変更がされた場合は読みなおす

set history=100

" 検索/置換
set hlsearch " 検索文字列をハイライトする
set ignorecase " 大文字と小文字を区別しない
set incsearch " インクリメンタルサーチを行う

set nobackup
set noswapfile
set shiftwidth=2
set showcmd
set virtualedit=onemore
set visualbell
set wildmenu
set wildmode=full
set wrapscan
set wrap
set updatetime=100
set laststatus=2 " ステータスラインを常に表示
set scrolloff=16

" オムニ補完の設定（insertモードでCtrl+oで候補を出す、Ctrl+n
" Ctrl+pで選択、Ctrl+yで確定）
set omnifunc=pythoncomplete#Complete
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=xmlcomplete#CompleteTags
set omnifunc=phpcomplete#CompletePHP

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter' " コメントアウト
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter' " gitの差分を左端に表示
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/neomru.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
call plug#end()

colorscheme onedark
syntax enable

hi Search ctermbg=DarkGreen

