export ZSH="/home/amazingefren/.oh-my-zsh"

ZSH_THEME="efren"

plugins=(git yarn web-search term_tab safe-paste dotenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

open () {
    xdg-open $* 2>/dev/null &
}
start () {
    xdg-open $*
}
fuck () {
    #cd -$*
    popd &>/dev/null
}
cd (){
    if [ "$1" != "" ]
    then
	pushd $* &>/dev/null
    else
    	pushd ~ &>/dev/null
    fi
}

screenshare () {
    killall xdg-desktop-portal-wlr
    if [ "$1" != "" ]; then
        zsh -c '
            /usr/lib/xdg-desktop-portal-wlr -r /usr/lib/xdg-desktop-portal-wlr -o $* &>/dev/null &
        '
    else
        zsh -c '
	        /usr/lib/xdg-desktop-portal-wlr -r /usr/lib/xdg-desktop-portal-wlr -o DP-1 &>/dev/null & 
        '
    fi
}

# compdef '_dirs -l' fuck 
alias l="ls"
alias la="ls -a"
alias ll="ls -al"
# alias cd="pushd &>/dev/null"
alias b=fuck
alias copy='wl-copy'
alias vimconf='vim ~/.config/nvim/init.vim'
alias swayconf='vim ~/.config/sway/config'
alias pop='matterhorn'
alias startcam='wf-recorder -g "$(slurp)" --muxer=v4l2 --codec=rawvideo --file=/dev/video2 -x yuv420p -d /dev/dri/renderD128'
# alias screenshare='/usr/lib/xdg-desktop-portal-wlr -r /usr/lib/xdg-desktop-portal-wlr -o'
source ~/.zshhidden

bindkey '^[l' forward-word
bindkey '^[h' backward-word
# Remap CTRL+BS (disabled and mapped as char "\x17" on alacritty config)
    # bindkey '^H' backward-kill-word
runfg (){echo; fg}
zle -N runfg
bindkey '^Z' runfg
#bindkey -s '^Z' 'fg^M'
# bindkey '^+?' backward-kill-word
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$HOME/.cargo/bin"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor line)
ZSH_HIGHLIGHT_STYLES[path]='fg=#ebdbb2,bold,bg=#3c3836'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#7c6f64'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ebdbb2,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#ebdbb2,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#ebdbb2,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#ebdbb2,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#cc241d,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#cc241d,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=#a89984'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#fabd2f,bold'
# ZSH_HIGHLIGHT_STYLES[line]='bold'
