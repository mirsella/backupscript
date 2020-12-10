alias chownm='s chown -R $USER: '
alias yays='yay -S --noconfirm --needed '
alias end='s pkill -f '
alias removelock='s rm /var/lib/pacman/db.lck'
alias rga='rga --no-ignore --hidden -i '
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
alias -s html='chromium'
alias -s odt='libreoffice'
alias -s pdf='chromium'
alias S='s systemctl '
alias s='doas '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
alias v='s nvim -p '
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_MEASUREMENT=en_US.UTF-8
# export LC_MONETARY=en_US.UTF-8
# export LC_NUMERIC=en_US.UTF-8
# export LC_TIME=en_US.UTF-8
export PATH="$PATH:/home/mirsella/dev/bin/"
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export TERMINAL=/usr/bin/konsole
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!
hash -d u=/run/media/mirsella
hash -d w=/run/media/mirsella/68EE6279EE623F84/Users/Eleve

