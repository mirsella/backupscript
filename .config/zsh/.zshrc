source ~/.config/zsh/lib/completion.zsh 
source ~/.config/zsh/lib/keybinds.zsh
source ~/.config/zsh/lib/spectrum.zsh
source ~/.config/zsh/lib/zprofile.zsh
source ~/.config/zsh/lib/fzf/fzf-completion.zsh
source ~/.config/zsh/lib/fzf/fzf-key-bindings.zsh

clip() { xclip -in -selection clipboard < "${@:-/dev/stdin}"; }
clipp() { xclip -out -selection clipboard; }
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

gitclearcommit() {
  branch=$(git branch | grep '\*' | sed 's/\* //')
  echo "WARNING !! THIS BRANCH WILL BE GONE FOREVER !!
  branch to clear : $branch "
  rm ~/.cache/$(basename $(dirname $(realpath $0)))
  cp -r ../$(basename $(dirname $(realpath $0))) ~/.cache/$(basename $(dirname $(realpath $0))) && echo "the repo was backed up in ~/.cache/$(basename $(dirname $(realpath $0))) "
  sleep 5
  git checkout --orphan ${branch}cleared
  git add -A
  git commit -m "cleared commit history $(date) "
  git branch -D ${branch}
  git branch -m ${branch}
}
gitreclonerepo() {
  rm ~/.cache/$(basename $(dirname $(realpath $0)))
  cp -r ../$(basename $(dirname $(realpath $0))) ~/.cache/$(basename $(dirname $(realpath $0))) && echo "the repo was backed up in ~/.cache/$(basename $(dirname $(realpath $0))) "
  remote=$(git branch -vv | rg -o '\[.*/' | sed 's/\[//; s/\///')
  remoteurl=$(git config --get remote.$remote.url)
  repofolder=$(basename $(realpath .))
  echo "WARNING !! NON PUSHED CHANGE WILL BE GONE FOREVER !!
  git clone from remote: $remote with url: $remoteurl "
  sleep 10
  cd ..
  rm -rf $repofolder
  git clone $remoteurl
}

bak() { sudo -E cp -r "${1}" "${1}.bak" }
bakm() { sudo -E mv "${1}" "${1}.bak" }
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
alias uefireboot='systemctl reboot --firmware-setup'
ortener() { curl -H "Content-Type: application/json" -d '{"url": "'$1'", "slug": "'$2'"}' https://ortener.herokuapp.com/url }
alias p='pnpm'
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias gclipp='git clone $(clipp)'
alias msq='vlc /run/media/mirsella/ssd/music/msq &! disown'
source ~/.config/zsh/lib/$(hostname)/hostname.zsh
source ~/.config/zsh/lib/forgit/forgit.plugin.zsh
