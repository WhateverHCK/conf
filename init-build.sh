#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install oh-my-zsh
# if you don't have zsh pre-installed, this may not work
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# list about apps you want to be managed by homebrew
brewList=(tmux youtube-dl autojump telnet mas mysql npm privoxy)
brewcaskList=(evernote iina mindmaster thunder wpsoffice typora postman baidunetdisk visual-studio-code iterm2 navicat-for-mysql)

appFromStore=(
# NeteaseMusic
944848654
# Wechat
836500024
# QQ
451108668
)

showPrompt(){
    echo ""
    echo "----------executing $1----------"
    echo ""
}

brewInstall(){
    showPrompt "brewInstall"

    for app in ${brewList[@]}
    do
        echo "installing "$app
        HOMEBREW_NO_AUTO_UPDATE=1 brew install $app
    done

    for app in ${brewcaskList[@]}
    do
        echo "installing "$app
        HOMEBREW_NO_AUTO_UPDATE=1 brew cask install $app
    done
}

masInstall(){
    showPrompt "masInstall"

    for app in ${appFromStore[@]}
    do
        echo "installing "$app
        mas install $app
    done
}

uiConfigure(){
    showPrompt "uiConfigure"

    # make icon smaller in dashboard
    defaults write com.apple.dock springboard-rows -int 5
    defaults write com.apple.dock springboard-columns -int 9
    defaults write com.apple.dock ResetLaunchPad -bool TRUE && killall Dock

    # set defalut path for screenshot
    defaults write com.apple.screencapture location ~/Documents/Screenshots && killall SystemUIServer
}

devEnvConfigure(){
    showPrompt "devEnvConfigure"

    # pull vimrc from github
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

vueEnvConfigure(){
    # use domestic registry
    npm config set registry https://registry.npm.taobao.org

    npm install vue -g
    npm install vue-cli -g
    npm install webpack -g
}

brewInstall
masInstall
uiConfigure
devEnvConfigure
vueEnvConfigure
