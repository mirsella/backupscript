alias chownm='s chown -R $USER: '
alias yays='yay -S --noconfirm --needed '
alias parus='paru -S --noconfirm --needed '
alias end='s pkill -f '
alias removelock='s rm /var/lib/pacman/db.lck'
alias rga='rga --no-ignore --hidden -S '
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
alias -s html='firefox-nightly'
alias -s odt='libreoffice'
alias -s pdf='firefox-nightly'
alias S='s systemctl '
alias s='sudo -E '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
alias v='s nvim -p '
export BROWSER=/usr/bin/firefox-nightly
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_MEASUREMENT=en_US.UTF-8
# export LC_MONETARY=en_US.UTF-8
# export LC_NUMERIC=en_US.UTF-8
# export LC_TIME=en_US.UTF-8
export PATH="$PATH:/home/mirsella/dev/bin/:/home/mirsella/.local/share/gem/bin"
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export TERMINAL=/usr/bin/konsole
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!
hash -d u=/run/media/mirsella
export PATH="$PATH:.local/share/gem/ruby/2.7.0/bin"

alias fr='libreoffice /home/mirsella/cours/fr/commentaires.odt & disown'
alias en='libreoffice /home/mirsella/cours/en/cours.odt & disown'
alias es='libreoffice /home/mirsella/cours/es/cours.odt & disown'
alias etlv='libreoffice /home/mirsella/cours/etlv/cours.odt & disown'
alias hg='libreoffice /home/mirsella/cours/hg/geo.odt & disown'
