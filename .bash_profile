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

# direnv
export EDITOR=vim
eval "$(direnv hook bash)"

# git alias
alias gb="git branch"
## alias ggg="/bin/bash ~/.my_shellscript/camel_snake.sh"
## alias gggall="/bin/bash ~/.my_shellscript/camel_snake_all.sh"
## alias ggu="/bin/bash ~/.my_shellscript/del_head_underscore.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
