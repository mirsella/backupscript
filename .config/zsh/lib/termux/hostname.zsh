export PATH="$PATH:/data/data/com.termux/files/home/.local/share/gem/bin"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>}
alias s='sudo '
alias end='sudo pkill -f '
alias rmf='rm -rf '
alias rm='rmtrash -rf '
alias chownm='chown -R $USER: '
export XDG_RUNTIME_DIR=$PREFIX/run
hash -d s=/sdcard/
hash -d m=/sdcard/Music
hash -d r=/data/data/com.termux/files/usr
alias v='nvim -p'

functions fdm() {
for arg in $@; do 
  ((iteration++))
  case $arg in
    -d)
      mode=delete
      shift $iteration
      ((iteration--))
      ;;
    -f)
      shift $iteration
      mode=ffmpeg
      ((iteration--))
      break
      ;;
    *) 
      searchpattern="$searchpattern$arg "
      shift $iteration
      ((iteration--))
      ;;
  esac
done
searchpattern=$(echo $searchpattern | sed 's/^ //; s/ $//')
files=$(fd -I -t f -e mp3 "${searchpattern}" /sdcard/Music/)
case $mode in 
  ffmpeg) 
    echo +$@+
    echo +$searchpattern+
    echo +$files+
    ffmpeg -ss "$@" -i "${files}" "${files}.mp3"
    mv "${files}.mp3" "${files}"
    ;;
  delete) while read file; do rm -v $file; done <<< $files;;
  *) echo $files;;
esac
unset searchpattern files mode iteration
}
