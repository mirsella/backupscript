source ~/.config/zsh/lib/completion.zsh 
source ~/.config/zsh/lib/keybinds.zsh
source ~/.config/zsh/lib/spectrum.zsh
source ~/.config/zsh/lib/zprofile.zsh
source ~/.config/zsh/lib/fzf/fzf-completion.zsh
source ~/.config/zsh/lib/fzf/fzf-key-bindings.zsh


_fzf_compgen_path() { command fd -t f -HL --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
_fzf_compgen_dir() { command fd -t d -HL --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
export FZF_DEFAULT_COMMAND='fd -t f -HIL --color=always -E .cache -E .local -E .git -E run -E media -E sys -E proc -E coc -E plugged '
export FZF_DEFAULT_OPTS='--ansi --preview="bat -pp --color=always {}" '
export VIMV_RM="rmtrash -rf"
export FORGIT_IGNORE_PAGER='bat -l gitignore -pp --color=always --theme="Monokai Extended Origin"'
export forgit_log=gl
export forgit_diff=gd
export forgit_add=gad
export forgit_reset_head=grh
export forgit_ignore=gi
export forgit_restore=gcf
export forgit_clean=gclean
export forgit_stash_show=gss
export forgit_cherry_pick=gcp

clip() { xclip -in -selection clipboard < "${1:-/dev/stdin}"; }
clipp() { xclip -out -selection clipboard; }
untill() {
  until eval "$1"; do
    sleep 1
  done
  eval "$2 "
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
alias gt='git stash '
alias rg='rg --hidden -i'
alias rge='rg --no-ignore --hidden -e '
alias tree='ls -Ah --tree '
alias gb='git branch '
alias gh='git checkout '
alias ga='git add -A '
alias gc='git commit '
alias gp='git push '
alias gac='git add -A; git commit -m "gcd $(date)"'
alias gcd='git commit -m "gcd $(date)"'
alias gacp='git add -A; git commit -m "gacp $(date)"; git push '
gm() { git commit -m "${@}" }
gamp() { git add -A; git commit -m "${@}"; git push }
alias fd='fd -HL -E run -E media -E sys -E proc '
alias trapp='trap "exit" SIGINT '
alias watch='watch '
ortener() { curl -H "Content-Type: application/json" -d '{"url": "'$1'", "slug": "'$2'"}' https://ortener.herokuapp.com/url }

source ~/.config/zsh/lib/$(hostname)/hostname.zsh
source ~/.config/zsh/lib/forgit/forgit.plugin.zsh
