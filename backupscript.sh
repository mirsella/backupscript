#!/usr/bin/zsh
CONFIG_FILE=$(dirname "$(realpath "$0")")/config.json

function gitF() {
  while true; do
    case "$1" in
      A) 
        shift
        git add -A || errorcode="$errorcode $?"
        ;;
      checkout)
        shift
        if git branch | grep -qw "$1"; then
          git checkout "$1"
          shift
        else
          echo "$1 is not a valid branch"
          exit
        fi
        ;;
      commit)
        shift
        if [[ -n "${gitF_commitmessage}" ]]; then
          git commit -m "$gitF_commitmessage" || errorcode="$errorcode $?"
        elif [[ ${gitF_commiteditor} = 1 ]]; then
          git commit  || errorcode=$?
        else
          git commit -m "backupscript $(date)" || errorcode="$errorcode $?"
        fi
        ;;
      push)
        shift
        git push ${gitF_force:-} ${gitF_remote:-} ${gitF_branch:-} || errorcode="$errorcode $?"
        ;;
      *) break;;
    esac
  done
  return ${errorcode##* }
}

while true; do # take care of options
  case $1 in
    -ignorehostname) 
      shift
      export ignorehostname=1
      echo 'ignoring hostname'
      ;;
    -f) # git push -f
      shift
      export gitF_force='-f'
      echo 'using git push -f'
      ;;
    -c) # commit message with editor
      shift
      export gitF_commiteditor=1
      ;;
    -m) # -m "commit message"
      shift
      case $1 in
        # -[a-zA-Z]|--[a-zA-Z]*|"")
        -*|"") 
          echo 'error -m : no valid argument given. need commit message in parentheses.'
          exit
          ;;
        *)
          export gitF_commitmessage="$1"
          shift
          ;;
      esac
      ;;
    -b) # change gitF branch
      shift
      case $1 in
        -*|"") 
          echo 'error -b : no valid argument given.'
          ;;
        *)
          export gitF_branch=$1
          shift
          echo 'change master'
          ;;
      esac
      ;;
    -r) # change gitF remote
      shift
      case $1 in
        -*|"") 
          echo 'error -o : no valid argument given'
          ;;
        *)
          export gitF_remote=$1
          shift
          echo 'change remote'
          ;;
      esac
      ;;
    --curl)
      shift
      cp "$CONFIG_FILE" "$CONFIG_FILE.bak"
      case $1 in
        -*|"") 
          REMOTE_URL=https://raw.githubusercontent.com/mirsella/backupscript/master/config.json # hardcoded default
          ;;
        *)
          REMOTE_URL=$1
          shift
      esac
       curl "$REMOTE_URL" -O "$CONFIG_FILE"
      ;;
    -l)
      shift
      case $1 in
        -*|"") 
          echo 'error -l : no valid argument given'
          ;;
        *)
          export CONFIG_FILE=$1
          shift
          ;;
      esac
      ;;
    *-h*)
      shift
      echo 'help -h :
      for more precise help go to github.com/mirsella/backupscript
      --curl <url> : curl config.json from a URL
      -l path/to/file.json : use a specific local config file
      -f : use git push -f
      -c : simply use git commit without the -m "backupscript $(date)". -c will open a $EDITOR window to put a commit message.
      -m <commit message> : use gitF commit -m "commit message" 
      -r <remote> : change gitF_remote value
      -b <branch> : change gitF_branch'
      ;;
    *) break;;
  esac
done

for argsloop in "$@"; do
  for cmdloop in $(seq 0 $(($(jq ".${argsloop}[]" "$CONFIG_FILE" | wc -l)-1))); do 
  cmd=$(jq ".${argsloop}[$cmdloop]" "$CONFIG_FILE" | sed 's/^"//; s/"$//')
  echo -ne "  $cmd"\\r
  if eval "$cmd"; then
    echo -e "$(tput bold)\e[32mok$(tput sgr0)  $cmd"
  else
    echo -e "$(tput bold)\e[31mcode ${errorcode:-$?}$(tput sgr0)  $cmd"
  fi
  unset errorcode
  done
done
