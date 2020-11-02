export PATH="$PATH:/data/data/com.termux/files/home/.local/share/gem/bin"
bak() { cp -r "${1}" "${1}.bak" }
bakm() { mv "${1}" "${1}.bak" }
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export EDITOR=nvim
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\%\^\(\)\{\}\<\>}
alias end='pkill -f '
alias rmf='~/../usr/bin/rm -rf '
alias rm='rmtrash -rf '
alias chownm='chown -R $USER: '
alias v='nvim -p'
export XDG_RUNTIME_DIR=$PREFIX/run
hash -d s=/sdcard/
hash -d m=/sdcard/Music
hash -d r=/data/data/com.termux/files/usr

functions fdm() {
unset searchpattern files mode iteration
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
    while read file; do
    ffmpeg -ss "$@" -i "${file}" "${file}.mp3"
    mv "${file}.mp3" "${file}"
  done <<< $files
    ;;
  delete) while read file; do rmf -v $file; done <<< $files;;
  *) echo $files;;
esac
}
