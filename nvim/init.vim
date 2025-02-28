" Python 3.x系のPathを設定
let g:python3_host_prog = '~/.anyenv/envs/pyenv/shims/python3'

" coc.nvim で 使う node.js を指定
let g:coc_node_path = '~/.anyenv/envs/nodenv/versions/20.8.0/bin/node'

" dein.vim を使うために以下を記述
runtime! plugins/dein.rc.vim

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

nnoremap <silent> <C-k> :bprev<CR>
nnoremap <silent> <C-j> :bnext<CR>

set ttyfast " ターミナル接続を高速化
set number
set enc=utf8
set fenc=utf-8

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " <TAB>で入力する数
set shiftwidth=2 " インデント

set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread "外部でファイルに変更がされた場合は読みなおす
set backspace=start
set nobackup
set nowritebackup

" set history=100
set incsearch " インクリメンタルサーチを行う
set laststatus=2 " ステータスラインを常に表示
set statusline=%F
