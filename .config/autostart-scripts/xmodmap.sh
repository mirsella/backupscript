#!/bin/bash
# switch backspace and capslock
# setxkbmap -option caps:backspace
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym BackSpace = Caps_Lock"
xmodmap -e "keysym Caps_Lock = BackSpace"
xmodmap -e "add Lock = Caps_Lock"
