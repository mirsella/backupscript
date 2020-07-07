source ~/.config/zsh/lib/completion.zsh
source ~/.config/zsh/lib/keybinds.zsh
source ~/.config/zsh/lib/spectrum.zsh
source ~/.config/zsh/lib/zprofile.zsh
source ~/.config/zsh/lib/fzf/fzf-completion.zsh
source ~/.config/zsh/lib/fzf/fzf-key-bindings.zsh
source ~/.config/zsh/lib/$(hostname)/$(hostname).zsh
# for file in /home/mirsella/.config/zsh/lib/*.zsh; do . "$file"; done


functions _fzf_compgen_path() { command fd -t f -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
functions _fzf_compgen_dir() { command fd -t d -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
export FZF_DEFAULT_COMMAND='fd -t f -HI --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged'
export FZF_DEFAULT_OPTS='--ansi --preview="bat -pp --color=always {}"'
export VIMV_USE_RMTRASH=1
export GIT_COMMITTER_EMAIL=mirsella@protonmail.com
export GIT_AUTHOR_EMAIL=mirsella@protonmail.com

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
  cp -r ../$(basename $(dirname $(realpath $0))) ~/.cache/$(basename $(dirname $(realpath $0))) && echo "the repo was backed up in ~/.cache/$(basename $(dirname $(realpath $0)))"
  sleep 5
  git checkout --orphan ${branch}cleared
  git add -A
  git commit -m "cleared commit history $(date)"
  git branch -D ${branch}
  git branch -m ${branch}
}
function gitreclonerepo() {
  cp -r ../$(basename $(dirname $(realpath $0))) ~/.cache/$(basename $(dirname $(realpath $0))) && echo "the repo was backed up in ~/.cache/$(basename $(dirname $(realpath $0)))"
  remote=$(git branch -vv | rg -o '\[.*/' | sed 's/\[//; s/\///')
  remoteurl=$(git config --get remote.$remote.url)
  repofolder=$(basename $(realpath .))
  echo "WARNING !! NON PUSHED CHANGE WILL BE GONE FOREVER !!
  git clone from remote: $remote with url: $remoteurl"
  sleep 5
  cd ..
  rm -rf $repofolder
  git clone $remoteurl
}

alias psaux='ps aux | rg '
alias NU='2> /dev/null ' #Silences stderr
alias NUL='> /dev/null 2>&1 ' #Silences both stdout and stderr
alias yt='youtube-dl -xic --audio-format mp3 -f bestaudio --audio-quality 0 '
alias mkdir='mkdir -p '
alias cp='cp -r '
alias grep='nocorrect grep --color=auto -Ei '
alias ls='ls -AhX --group-directories-first --color=auto '
alias ll='ls -AhXl --group-directories-first --color=auto '
alias v='nvim -p '
alias bat='bat -pp --color=always --theme="Monokai Extended Origin"'
alias q='exit '
alias dut='du -cksh '
alias rg='rg --no-ignore --hidden -i '
alias rge='rg --no-ignore --hidden -e '
alias tree='tree -Ca '
alias gb='git branch'
alias gch='git checkout'
alias gp='git push'
alias ga='git add -A'
alias gc='git commit -m "gc $(date)"'
alias gac='git add -A; git commit -m "gac $(date)"'
alias gcp='git commit -m "gcp $(date)"; git push '
alias gacp='git add -A; git commit -m "gacp $(date)"; git push '
alias fd='fd -HIL '
