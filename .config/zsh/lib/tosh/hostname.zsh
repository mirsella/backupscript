alias chownm='s chown -R $USER: '
alias removelock='sudo rm /var/lib/pacman/db.lck'
alias end='sudo pkill -f '
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
alias S='s systemctl '
alias s='sudo -E '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
hash -d u=/run/media/mirsella
alias v='s nvim -p '
export EDITOR=/usr/bin/nvim
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_MEASUREMENT=en_US.UTF-8
# export LC_MONETARY=en_US.UTF-8
# export LC_NUMERIC=en_US.UTF-8
# export LC_TIME=en_US.UTF-8
export PATH="$PATH:/home/mirsella/.local/bin:/hdd/dev/bin"
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
hash -d s=/hdd
alias yays='yay -S --noconfirm --needed '
alias rga='rga --no-ignore --hidden -i '
export LC_MONETARY=en_US.UTF-8
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!

# switch backspace and capslock
# setxkbmap -option caps:backspace
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym BackSpace = Caps_Lock"
xmodmap -e "keysym Caps_Lock = BackSpace"
xmodmap -e "add Lock = Caps_Lock"
