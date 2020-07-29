([[ -f ~/.gtkrc-2.0 ]] && rm -v ~/.gtkrc-2.0) &!
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/konsole
export BROWSER=/usr/bin/chromium
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
hash -d u=/run/media/mirsella
alias -s odt='libreoffice'
alias -s pdf='chromium'
alias -s html='chromium'

alias end='sudo pkill -f '
alias rm='s rmtrash -rf '
alias rmf='s /bin/rm -rf '
alias trash-restore='s trash-restore '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias S='s systemctl '
alias s='sudo -E'
alias chownm='s chown -R $USER: '
alias v='s nvim -p'
alias removelock='sudo rm /var/lib/pacman/db.lck'
alias rga='rga --no-ignore --hidden -i '
