alias yays='yay -S --noconfirm --needed '
alias nvidiar='yay -R --noconfirm cuda nvtop waifu2x-ncnn-vulkan'
alias nvidias='yay -S --needed --noconfirm cuda nvtop waifu2x-ncnn-vulkan'
alias chownm='s chown -R $USER: '
alias end='sudo pkill -f '
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias removelock='sudo rm /var/lib/pacman/db.lck'
alias rga='rga --no-ignore --hidden -i '
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
alias -s html='chromium'
alias -s odt='libreoffice'
alias -s pdf='chromium'
alias S='s systemctl '
alias s='sudo -E '
alias trash-empty='s trash-empty '
alias trash-list='s trash-list '
alias trash-restore='s trash-restore '
alias v='s nvim -p '
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export PATH="$PATH:/run/media/mirsella/ssd/dev/bin"
export QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1
export TERMINAL=/usr/bin/konsole
export WORDCHARS=${WORDCHARS/\*\?\_\-\.\[\]\~\=\/\&\;\!\#\$\%\^\(\)\{\}\<\>} 
([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!
hash -d d=/run/media/mirsella/ssd/documents/
hash -d m=/run/media/mirsella/ssd/music/
hash -d s=/run/media/mirsella/ssd/
hash -d u=/run/media/mirsella
hash -d w=/run/media/mirsella/windows/Users/mirsella/
alias fanm='nbfc set -f 1 -s 100 && nbfc set -f 0 -s 100'
alias fan='nbfc set -f 1 -a && nbfc set -f 0 -a'


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
files=$(fd -I -t f -e mp3 "${searchpattern}" /run/media/mirsella/ssd/music/)
case $mode in 
  ffmpeg) 
    ffmpeg -ss "$@" -i "${files}" "${files}.mp3"
    mv -v "${files}.mp3" "${files}"
    ;;
  delete) while read file; do rmtrash -v $file; done <<< $files;;
  *) echo $files;;
esac
unset searchpattern files mode iteration
}