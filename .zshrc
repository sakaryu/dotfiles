# anyenv

if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # tmux対応
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# golang
export PATH="$GOROOT/bin/$PATH"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/flutter/bin"

# brew git
export PATH="/usr/local/Cellar/git/2.26.1_1/bin/git:$PATH"

# .bin (とりあえずterraform-lspのみ置いてある)
export PATH="$PATH:$HOME/.bin"

: "一般的な設定" && {
  autoload -U compinit && compinit -d ${COMPDUMPFILE} # 補完機能の強化
  setopt correct # 入力しているコマンド名が間違っている場合にもしかして：を出す。
  setopt nobeep # ビープを鳴らさない
  setopt no_tify # バックグラウンドジョブが終了したらすぐに知らせる。
  unsetopt auto_menu # タブによるファイルの順番切り替えをしない
  setopt auto_pushd # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
  setopt auto_cd # ディレクトリ名を入力するだけでcdできるようにする
  setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
}

: "ヒストリ関連の設定" && {
  HISTSIZE=10000 # メモリに保存される履歴の件数
  SAVEHIST=10000 # 履歴ファイルに保存される履歴の件数
  setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
  setopt hist_ignore_all_dups # 重複するコマンドは古い法を削除する
  setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
  setopt hist_no_store # historyコマンドは履歴に登録しない
  setopt hist_reduce_blanks # 余分な空白は詰めて記録
  setopt hist_verify # `!!`を実行したときにいきなり実行せずコマンドを見せる
}

: "キーバインディング" && {
  : "Ctrl-Dでシェルからログアウトしない" && {
    setopt ignoreeof
  }
  : "Ctrl-Wでパスの文字列などをスラッシュ単位でdeleteできる" && {
    autoload -U select-word-style
    select-word-style bash
  }
  : "Ctrl-[で直前コマンドの単語を挿入できる" && {
    autoload -Uz smart-insert-last-word
    zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' # [a-zA-Z], /, \ のうち少なくとも1文字を含む長さ2以上の単語
    zle -N insert-last-word smart-insert-last-word
    bindkey '^[' insert-last-word
    # see http://qiita.com/mollifier/items/1a9126b2200bcbaf515f
  }
}

: "プラグイン" && {
  export ZPLUG_HOME=/usr/local/opt/zplug
  [ -f "$ZPLUG_HOME/init.zsh" ] || brew install zplug # zplugはHomebrewからインストール
  source $ZPLUG_HOME/init.zsh
  zplug "zsh-users/zsh-completions" # 多くのコマンドに対応する入力補完 … https://github.com/zsh-users/zsh-completions
  zplug "mafredri/zsh-async" # "sindresorhus/pure"が依存している
  zplug "sindresorhus/pure", use:pure.zsh, as:theme && { # 美しく最小限で高速なプロンプト … https://github.com/sindresorhus/pure
    export PURE_PROMPT_SYMBOL="❯❯❯"
  }
  zplug "zsh-users/zsh-syntax-highlighting", defer:2 # fishシェル風のシンタクスハイライト … https://github.com/zsh-users/zsh-syntax-highlighting
  zplug "supercrabtree/k" # git情報を含んだファイルリストを表示するコマンド … https://github.com/supercrabtree/k
  zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf # あいまい検索ができるコマンド … https://github.com/junegunn/fzf
  zplug "junegunn/fzf", as:command, use:bin/fzf-tmux # tmuxでfzfを使えるようにするプラグイン
  zplug "junegunn/fzf", use:shell/key-bindings.zsh # Ctrl-Rで履歴検索、Ctrl-Tでファイル名検索補完できる
  zplug "junegunn/fzf", use:shell/completion.zsh # cd **[TAB], vim **[TAB]などでファイル名を補完できる
  zplug "b4b4r07/enhancd", use:init.sh # cdコマンドをインタラクティブにするプラグイン … https://github.com/b4b4r07/enhancd
  zplug 'b4b4r07/gomi', as:command, from:gh-r # 消したファイルをゴミ箱から復元できるrmコマンド代替 … https://github.com/b4b4r07/gomi
  zplug "momo-lab/zsh-abbrev-alias" # 略語展開(iab)を設定するためのプラグイン … http://qiita.com/momo-lab/items/b1b1afee313e42ba687b
  zplug "paulirish/git-open", as:plugin # GitHub, GitLab, BitBucketを開けるようにするコマンド … https://github.com/paulirish/git-open
  zplug check || zplug install
  zplug load
}

: "cd先のディレクトリのファイル一覧を表示する" && {
  [ -z "$ENHANCD_ROOT" ] && function chpwd { tree -L 1 } # enhancdがない場合
  [ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="tree -L 1" # enhancdがあるときはそのHook機構を使う
}

: "sshコマンド補完を~/.ssh/configから行う" && {
  function _ssh { compadd $(fgrep 'Host ' ~/.ssh/*/config | grep -v '*' |  awk '{print $2}' | sort) }
}

# Import from /.zshrc
for i in ~/.zsh/*.zsh; do
 source $i
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Android Studio Path
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
