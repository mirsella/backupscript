source "$ZDOTDIR"/lib/$(hostname)/plugins.zsh
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.cache/history
export HISTCONTROL=ignoreboth
export PROMPT="%B%F{219}[%n@%M %~]%(!.%F{196}#%f.$) %f%b"
# export PROMPT="%B%{%}%(4~|%-1~/.../%2~|%~)%u%b >%{%}>%B%(?.%{%}.%{%})>%{%}%b"
export RPROMPT="%B%F{225}%*%f%b"
export CASE_INSENSITIVE=true
export HYPHEN_INSENSITIVE=true
export ENABLE_CORRECTION=true
export MENU_COMPLETE=true


_fzf_compgen_path() { command fd -t f -HIL --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
_fzf_compgen_dir() { command fd -t d -HIL --color=always -E .cache -E .local -E .git -E run -E media -E coc -E plugged . $1 }
export FZF_DEFAULT_COMMAND='fd -t f -HLI --color=always -E .cache -E .local -E .git -E run -E media -E sys -E proc -E coc -E plugged '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--ansi --height=100 --preview="
if [ -d {} ]; then
  lsd -Ah {}
else 
  bat -pp --color=always --theme=\"Monokai Extended Origin\" {}
fi
"'
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"

export VIMV_RM="rmtrash -rf"
export FORGIT_IGNORE_PAGER='bat -l gitignore -pp --color=always --theme="Monokai Extended Origin"'
export forgit_log=gl
export forgit_diff=gd
export forgit_add=gad
export forgit_reset_head=grh
export forgit_ignore=gi
export forgit_restore=gcf
export forgit_clean=gclean
export forgit_stash_show=gss
export forgit_cherry_pick=gcp

setopt share_history # share history between all sessions.
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

# paste url without quote
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic


setopt extendedglob local_options
autoload -U compinit
local zcd=${ZDOTDIR:-$HOME}/.zcompdump
local zcdc="$zcd.zwc"
# Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
# in the background as this is doesn't affect the current session
if [[ -f "$zcd"(#qN.m+1) ]]; then
      compinit -i -d "$zcd"
      { rm -f "$zcdc" && zcompile "$zcd" } &!
      # echo "$zcd is older than 1 day, recompiled"
else
      compinit -C -d "$zcd"
      { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
fi
unsetopt extendedglob local_options


# fzf-tab
disable-fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'tab:toggle'
bindkey '²' toggle-fzf-tab
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ":fzf-tab:*" fzf-flags '--preview-window=right:100:wrap' '--height=100' '--ansi'
zstyle ':fzf-tab:complete:*' fzf-preview '
if [ -d $realpath ]; then
 lsd -Ah $realpath
else 
  bat -pp --color=always --theme="Monokai Extended Origin" $realpath
fi
'

# force clipboad to xclip for the system clipboard plugin
_zsh_system_clipboard_set=(xclip -sel $clipboard_selection -in)
_zsh_system_clipboard_get=(xclip -sel $clipboard_selection -out)

# zsh auto notify
export AUTO_NOTIFY_THRESHOLD=10
export AUTO_NOTIFY_TITLE="%command"
export AUTO_NOTIFY_BODY="%elapsed sec\n%exit_code"
export AUTO_NOTIFY_EXPIRE_TIME=4000
export AUTO_NOTIFY_IGNORE=("less" "more" "man" "tig" "watch" "git commit" "top" "htop" "ssh" "nano" "ssh" "v" "nvim" "s nvim" "s nvim -p" "sudo -E nvim")

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
ZSH_HIGHLIGHT_STYLES[comment]='fg=240'
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/
