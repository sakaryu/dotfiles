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
