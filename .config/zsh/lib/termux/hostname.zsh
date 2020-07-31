export PATH="$PATH:/data/data/com.termux/files/home/.local/share/gem/bin"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
alias end='sudo pkill -f '
alias rm='rmtrash -rf '
alias rmf='/bin/rm -rf '
alias chownm='chown -R $USER: '
export XDG_RUNTIME_DIR=$PREFIX/run
hash -d s=/sdcard/
hash -d m=/sdcard/Music
hash -d r=/data/data/com.termux/files/usr
alias v='nvim -p'
functions fdm() {
  if [[ "${@: -1}" = "d" ]]; then
    args="${@: 1:-1}"
    delete=1
  else
    args="$@"
  fi
  files=$(fd -I -t f -e mp3 "${args}" /sdcard/Music/)
  if [[ -n $delete ]]; then
    # ~r/bin/rm "${files}"
    while read file; do ~r/bin/rm $file; done <<< $files
      # echo files: $files
    else
      echo "$(echo $files | sed 's#/sdcard/Music/##')"
  fi
unset delete args files
}
