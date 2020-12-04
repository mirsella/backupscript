alias chownm='s chown -R $USER: '
alias end='sudo pkill -f '
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
alias S='s systemctl '
alias s='sudo -E '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
alias v='s nvim -p '
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/local/bin/nvim
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export PATH="$PATH:/home/mirsella/.local/bin:/hdd/dev/bin"
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export TERMINAL=/usr/bin/konsole
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
hash -d s=/hdd

# switch backspace and capslock
# setxkbmap -option caps:backspace
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym BackSpace = Caps_Lock"
xmodmap -e "keysym Caps_Lock = BackSpace"
xmodmap -e "add Lock = Caps_Lock"
