" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

" dein.vim 本体がインストールされるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" プラグインの設定ファイルPath
let s:toml = '~/.config/nvim/plugins/config/dein.toml'
let s:toml_lazy = '~/.config/nvim/plugins/config/dein_lazy.toml'

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " dein.tomlを起動時ロードの設定ファイルとして読み込む
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" Neovim起動時にdein.tomlファイルをチェックし、未インストールのプラグインがあった場合インストールする
if dein#check_install()
  call dein#install()
endif

" Neovim起動時にdein.tomlファイルをチェックし、削除されているプラグインがあった場合アンインストールする
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable
