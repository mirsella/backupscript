source "$ZDOTDIR"/lib/fdm.zsh
alias nvidiar='yay -R --noconfirm cuda nvtop srmd-ncnn-vulkan'
alias nvidias='yay -S --needed --noconfirm cuda nvtop srmd-ncnn-vulkan'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias rmf='s /bin/rm -rf '
alias rm='s rmtrash -rf '
# export PATH="$PATH:/run/media/mirsella/ssd/dev/bin:/home/mirsella/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:/run/media/mirsella/ssd/dev/bin"
# ([[ -f ~/.gtkrc-2.0 ]] && /bin/rm -v ~/.gtkrc-2.0) &!
hash -d d=/run/media/mirsella/ssd/documents.git/
hash -d m=/run/media/mirsella/ssd/music/
hash -d s=/run/media/mirsella/ssd/
hash -d w=/run/media/mirsella/windows/Users/mirsella/
alias fanm='nbfc set -f 1 -s 100 && nbfc set -f 0 -s 100'
alias fan='nbfc set -f 1 -a && nbfc set -f 0 -a'
