# set bash into vim mode
set -o vi

# start tmux soon as terminal starts
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
     tmux attach || tmux new; exit
fi

##################################################
# function definition zone
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:8118"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}
# aliases set zone


# environment variables set zone
# disable auto update of homebrew 
export HOMEBREW_NO_AUTO_UPDATE=true
