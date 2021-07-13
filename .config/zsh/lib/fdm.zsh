#!/bin/zsh
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
