#!/usr/bin/env bash
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
        if git checkout "$1" ; then
          shift
        else
          echo "$1 is not a valid branch. exiting"
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
    -e) 
      shift
      case $1 in
        # -[a-zA-Z]|--[a-zA-Z]*|"")
          -*|"") 
          echo 'error --value : no valid argument given. need the variable name'
          exit
          ;;
        *)
          eval export $1 = 1
          shift
          ;;
      esac
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
          REMOTE_URL=https://raw.githubusercontent.com/mirsella/backupscript/master/config.json # default
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
      echo "help -h :
--curl <url>  # curl config.json from a URL
-l path/to/file.json   # use a specific local config file
-f  # add -f to gitF push
-c  # don't add -m to gitF commit
-m "commit message"   # specify git commit message. parentheses are important !
--export var123test  # export var123test = 1, accessible through config.json's command. be creative

# thoses are used in gitF push or can be acessed in config.json's command.
-b branch # git push to a specific branch
-o origin # git push to a specific origin

gitF is function in backupscript.sh. see example in config.json :
A  # git add -A
commit  # git commit -m "backupscript $(date)" # -m not used here if -c or -m
push  # git push ${gitF_force:-} ${gitF_remote:-} ${gitF_branch:-} 
checkout branch # git checkout branch"
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
