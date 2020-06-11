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

  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

syntax on
colorscheme onedark

autocmd BufNewFile,BufRead *.vue setfiletype vue

" エディタのコマンドではありません、の解決
filetype plugin indent on

" カーソル移動
inoremap <C-a> <Home>
nnoremap <C-a> <Home>
tnoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <C-e> <End>
tnoremap <C-e> <End>
inoremap <C-f> <RIGHT>
tnoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
tnoremap <C-b> <LEFT>

" Netrw
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_keepdir=0
let g:netrw_banner = 0

let g:solarized_termcolors=256
let mapleader = "\<Space>"

runtime macros/matchit.vim

set lazyredraw
set ttyfast " ターミナル接続を高速化
set backspace=start
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

syntax enable

hi Search ctermbg=DarkGreen

