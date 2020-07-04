export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/konsole
export BROWSER=/usr/bin/chromium
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
hash -d s=/run/media/mirsella/ssd/
hash -d d=/run/media/mirsella/ssd/documents/
hash -d w=/run/media/mirsella/windows/Users/mirsella/
hash -d m=/run/media/mirsella/ssd/music/
hash -d u=/run/media/mirsella
alias -s odt='libreoffice'
alias -s pdf='chromium'
alias -s html='chromium'
alias fanm='nbfc set -f 1 -s 100 && nbfc set -f 0 -s 100'
alias fan='nbfc set -f 1 -a && nbfc set -f 0 -a'
alias removelock='sudo rm /var/lib/pacman/db.lck'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias rga='rga --no-ignore --hidden -i '
