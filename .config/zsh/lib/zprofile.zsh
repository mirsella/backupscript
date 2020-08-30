source $ZDOTDIR/lib/$(hostname)/plugins.zsh
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.cache/history
export HISTCONTROL=ignoreboth
export PROMPT="%B%F{219}[%n@%M %~]%(!.%F{196}#%f.$) %f%b"
# export PROMPT="%B%{%}%(4~|%-1~/.../%2~|%~)%u%b >%{%}>%B%(?.%{%}.%{%})>%{%}%b"
export RPROMPT="%B%F{225}%*%f%b"
export CASE_INSENSITIVE=true
export HYPHEN_INSENSITIVE=true
export ENABLE_CORRECTION=true
export MENU_COMPLETE=true

# setopt share_history # share history between all sessions.
setopt histappend
setopt prompt_subst
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt correct # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt always_to_end
setopt interactive_comments
setopt long_list_jobs
setopt complete_in_word
unsetopt auto_menu # automatically use menu completion
unsetopt hist_verify
zstyle ':completion::complete:*' gain-privileges 1


setopt extendedglob local_options
autoload -U compinit
local zcd=${ZDOTDIR:-$HOME}/.zcompdump
local zcdc="$zcd.zwc"
# Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
# in the background as this is doesn't affect the current session
if [[ -f "$zcd"(#qN.m+1) ]]; then
      compinit -i -d "$zcd"
      { rm -f "$zcdc" && zcompile "$zcd" } &!
      echo "$zcd is older than 1 day, recompiled"
else
      compinit -C -d "$zcd"
      { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
fi


# fzf-tab
disable-fzf-tab
bindkey '²' toggle-fzf-tab
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:*' single-group ''
zstyle ':fzf-tab:*' insert-space true
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview="bat -pp --color=always {}"
FZF_TAB_COMMAND=(
    fzf
    --ansi   # Enable ANSI color support, necessary for showing groups
    --expect='$continuous_trigger' # For continuous completion
    '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
    --nth=2,3 --delimiter='\x00'  # Don't search prefix
    --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
    --tiebreak=begin -m --bind=tab:down,btab:up,change:top,tab:toggle --cycle
    '--query=$query'   # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

# zsh auto notify
export AUTO_NOTIFY_THRESHOLD=10
export AUTO_NOTIFY_TITLE="%command"
export AUTO_NOTIFY_BODY="%elapsed sec\n%exit_code"
export AUTO_NOTIFY_EXPIRE_TIME=4000
export AUTO_NOTIFY_IGNORE=("docker" "man")

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='(man |pacman -S |yay -S)*'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[error]=fg=160,bold
ZSH_HIGHLIGHT_STYLES[globbing]=fg=225,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=225,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=225,underline
ZSH_HIGHLIGHT_STYLES[autodirectory]=$ZSH_HIGHLIGHT_STYLES[path]
ZSH_HIGHLIGHT_STYLES[bracket-error]=$ZSH_HIGHLIGHT_STYLES[error]
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=129,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=147,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=159,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=193,bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=002,bold
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=159
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]=$ZSH_HIGHLIGHT_STYLES[error]
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=195
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=$ZSH_HIGHLIGHT_STYLES[error]
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=194
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=$ZSH_HIGHLIGHT_STYLES[error]
ZSH_HIGHLIGHT_STYLES[redirection]=fg=201,bold
ZSH_HIGHLIGHT_STYLES[assign]=fg=213,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=213
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/
