# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char # Fix backspace bug when switching modes

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[0 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

echo -ne '\e[6 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

bindkey '^r' history-incremental-pattern-search-backward # Enable searching through history
autoload edit-command-line; zle -N edit-command-line; bindkey '^v' edit-command-line # Edit line in vim buffer ctrl-v
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line # Enter vim buffer from normal mode

bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
bindkey "^[[3~" delete-char # [Delete] - delete forward
bindkey '^?' backward-delete-char # [Backspace] - delete backward
bindkey ' ' magic-space # [Space] - do history expansion
bindkey "^[[H" beginning-of-line # start key
bindkey "^[[F" end-of-line # end key 
bindkey "^[[A" up-line-or-history # [PageUp] - Up a line of history
bindkey "^[[B" down-line-or-history # [PageDown] - Down a line of history
bindkey '^H' backward-kill-word # ctrl+ backspace delete world backward
