# set bash into vim mode
set -o vi

# start tmux soon as terminal starts
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
     tmux attach || tmux new; exit
fi

##################################################
# aliases set zone


# environment variables set zone
