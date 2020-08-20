#!/usr/bin/env bash
CONFIG_FILE=$(dirname "$(realpath "$0")")/config.json

while true; do # take care of options
  case $1 in
    -e) 
      shift
      case $1 in
        -*|"") 
          echo 'error -e : no argument detected'
          exit
          ;;
        *=*)
          eval export $1
          shift
          ;;
        *)
          eval export $1=1
          shift
          ;;
      esac
      ;;
    *) break;;
  esac
done
bcommit() { git commit -m "${@:-backupscript} $(date)"; }

for loop_options in "$@"; do
  for loop_cmd in $(seq 0 $(($(jq ".${loop_options}[]" "$CONFIG_FILE" | wc -l)-1))); do 
  cmd=$(jq ".${loop_options}[$loop_cmd]" "$CONFIG_FILE" | sed 's/^"//; s/"$//')
  echo -ne "  $cmd"\\r
  if eval "$cmd"; then
    echo -e "$(tput bold)\e[32mok$(tput sgr0)  $cmd"
  else
    echo -e "$(tput bold)\e[31mcode ${errorcode:-$?}$(tput sgr0)  $cmd"
  fi
  unset errorcode
  done
done
