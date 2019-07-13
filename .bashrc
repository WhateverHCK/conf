# set bash into vim mode
set -o vi

# make autojump work
[[ -s ~/.autojump/etc/profile.d/autojump.sh  ]] && . ~/.autojump/etc/profile.d/autojump.sh

# start tmux soon as terminal starts
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
     tmux attach || tmux new; exit
fi
