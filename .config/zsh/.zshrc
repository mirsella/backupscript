source ~/.config/zsh/lib/completion.zsh 
source ~/.config/zsh/lib/keybinds.zsh
source ~/.config/zsh/lib/spectrum.zsh
source ~/.config/zsh/lib/zprofile.zsh
source ~/.config/zsh/lib/fzf/fzf-completion.zsh
source ~/.config/zsh/lib/fzf/fzf-key-bindings.zsh
source ~/.config/zsh/lib/forgit/forgit.plugin.zsh

clip() { xclip -in -selection clipboard < "${@:-/dev/stdin}"; }
clipp() { xclip -out -selection clipboard; }
winboot() {
  WINDOWS_TITLE=`grep -i "^menuentry 'Windows" /boot/grub/grub.cfg|head -n 1|cut -d"'" -f2`
  sudo grub-reboot "$WINDOWS_TITLE"
  sudo reboot
}
untill() {
  until eval "$1"; do
    sleep 1
  done
  eval "$2 "
}
notif() {
  source ~/.config/token/telegram.token
  curl -s -X POST -H 'Content-Type: application/json' -d '{"chat_id": '$TgId', "text": "'"${@:-$(read a; echo $a)}"'"}' "https://api.telegram.org/bot$TgToken/sendMessage"
}
bak() { sudo -E cp -r "${1}" "${1}.bak" }
bakm() { sudo -E mv "${1}" "${1}.bak" }

([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!
hash -d u=/run/media/mirsella
export EDITOR='/usr/bin/nvim'
export BROWSER='/usr/bin/xdg-open'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MEASUREMENT=fr_FR.UTF-8
export LC_MONETARY=fr_FR.UTF-8
export LC_NUMERIC=fr_FR.UTF-8
export LC_TIME=fr_FR.UTF-8
export PATH="$PATH:/home/mirsella/.local/bin:/home/mirsella/.local/share/gem/bin:/home/mirsella/.local/share/npm/bin"
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
alias -s html='firefox-nightly'
alias -s odt='libreoffice'
alias -s pdf='firefox-nightly'
alias psaux='ps aux | rg '
alias NU='2> /dev/null ' #Silences stderr
alias NUL='> /dev/null 2>&1 ' #Silences both stdout and stderr
alias yt='youtube-dl -xic --audio-format mp3 -f bestaudio --audio-quality 0 '
alias mkdir='mkdir -p '
alias cp='cp -r '
# alias ls='ls -AhX --group-directories-first --color=auto '
# alias ll='ls -AhXl --group-directories-first --color=auto '
alias ls='lsd -Ah '
alias ll='lsd -Ahl '
alias bat='bat -pp --color=always --theme="Monokai Extended Origin" '
alias q='exit '
alias dut='du -cksh '
alias rg='rg --hidden -S '
alias gch='git checkout '
alias tree='ls --tree '
alias gb='git branch '
alias ga='git add -A '
alias gt='git stash '
alias gc='git commit '
alias gp='git push '
alias gcd='git commit -m "gcd $(date)"'
gm() { git commit -m "${@}" }
gamp() { git add -A; git commit -m "${@:-$(date)}"; git push }
alias fd='fd -HL -E run -E media -E sys -E proc '
alias fda='fd -I '
alias trapp='trap "exit" SIGINT '
alias watch='watch '
alias yayupdate='yay -Syu --noconfirm; notif "yay finished $?"'
alias update='paru -Syu --noconfirm; notif "yay finished $?"'
alias end='s pkill -f '
alias chownm='s chown -R $USER: '
alias S='sudo systemctl '
alias s='sudo -E '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
alias uefireboot='systemctl reboot --firmware-setup'
ortener() { curl -H "Content-Type: application/json" -d '{"url": "'$1'", "slug": "'$2'"}' https://ortener.herokuapp.com/url }
alias p='pnpm'
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias gclipp='git clone $(clipp)'
alias msq='vlc /run/media/mirsella/ssd/music/ &! disown'
alias sshphone="ssh u0_a355@$(ip r | rg default | cut -d' ' -f3) -p 2222"
alias vpn='s protonvpn c -f'
alias v='s nvim -p '
alias yays='yay -S --noconfirm --needed '
alias parus='paru -S --noconfirm --needed '
alias rga='rga --no-ignore --hidden -S '



source ~/.config/zsh/lib/$(hostname)/hostname.zsh
