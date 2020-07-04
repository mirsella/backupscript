source /home/mirsella/.config/zsh/lib/completion.zsh
source /home/mirsella/.config/zsh/lib/keybinds.zsh
source /home/mirsella/.config/zsh/lib/spectrum.zsh
source /home/mirsella/.config/zsh/lib/zprofile.zsh
source /home/mirsella/.config/zsh/lib/fzf/fzf-completion.zsh
source /home/mirsella/.config/zsh/lib/fzf/fzf-key-bindings.zsh
source /home/mirsella/.config/zsh/lib/$(hostname)/$(hostname).zsh
# for file in /home/mirsella/.config/zsh/lib/*.zsh; do . "$file"; done


functions _fzf_compgen_path() { command fd -t f -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
functions _fzf_compgen_dir() { command fd -t d -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
export FZF_DEFAULT_COMMAND='fd -t f -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged'
export FZF_DEFAULT_OPTS='--ansi --preview="bat -pp --color=always {}"'
export VIMV_USE_RMTRASH=1
export GIT_COMMITTER_EMAIL=mirsella@protonmail.com
export GIT_AUTHOR_EMAIL=mirsella@protonmail.com

([[ -f /home/mirsella/.gtkrc-2.0 ]] && rm -v /home/mirsella/.gtkrc-2.0) &!


function clip() { xclip -in -selection clipboard < "${1:-/dev/stdin}"; }
function clipp() { xclip -out -selection clipboard; }
function untill() {
  until eval "$1"; do
    sleep 1
  done
  eval "$2"
}

function gitclearcommit() {
  branch=$(git branch | grep '\*' | sed 's/\* //')
  echo "WARNING !! THIS BRANCH WILL BE GONE FOREVER !!
  branch to clear : $branch"
  sleep 5
  cp -r ../$(basename $(dirname $(realpath $0))) ~/.cache/$(basename $(dirname $(realpath $0))) && echo "the repo was backed up in ~/.cache/$(basename $(dirname $(realpath $0)))"
  git checkout --orphan ${branch}cleared
  git add -A
  git commit -m "cleared commit history $(date)"
  git branch -D ${branch}
  git branch -m ${branch}
}



alias end='sudo pkill -f '
alias psaux='ps aux | rg '
alias NU='2> /dev/null ' #Silences stderr
alias NUL='> /dev/null 2>&1 ' #Silences both stdout and stderr
alias yt='youtube-dl -xic --audio-format mp3 -f bestaudio --audio-quality 0 '
alias mkdir='mkdir -p '
alias cp='cp -r '
alias rm='sudo rmtrash -rf '
alias rmt='sudo rmtrash -rf '
alias rmf='sudo /bin/rm -rf '
alias trash-restore='sudo trash-restore '
alias trash-empty='sudo trash-empty '
alias trash-list='sudo trash-list '
alias grep='nocorrect grep --color=auto -Ei '
alias ls='ls -AhX --group-directories-first --color=auto '
alias ll='ls -AhXl --group-directories-first --color=auto '
alias v='sudo -E nvim -p '
alias S='sudo systemctl '
alias sudo='sudo -E '
alias s='sudo '
alias bat='bat -pp --color=always --theme="Monokai Extended Origin"'
alias q='exit '
alias chownm='sudo chown -R mirsella '
alias dut='du -cksh '
alias rg='rg --no-ignore --hidden -i '
alias rge='rg --no-ignore --hidden -e '
alias tree='tree -Ca '
alias gb='git branch'
alias gch='git checkout'
alias ga='git add -A'
alias gc='git commit -m "gc $(date)"'
alias gcp='git commit -m "gcp $(date)"; git push '
alias gacp='git add -A; git commit -m "gacp $(date)"; git push '
alias fd='fd -HIL '
