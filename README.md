<h2>a good backup have to be easy to use.</h2>
<h4>this one is easy to use, not to setup...</h4>

this yet another dotfiles manager is special because it use a single config file, in json.
the script loop into a part of the json, given as a argument to the script.
i'll try to do a example, open the config.json file to understand better.
you can change all the command executed, so it can be used for a lot more than dotfiles !

<h3>Example</h3>

PS : ```b``` is a symlink to backupscript.sh, because i'm lazy

so with my current config.json file, i can : 
```shell
b d   # specific backup config
b t   # specific backup config
b r   # specific backup config
b u   # specific backup config
b s   # backup this repo
b update.s  # to sync my dotfiles across multiple devices
b update.d  # to sync my backupscript config across multiple devices
b install.script  # clone this repo and dotfiles.git in it
b install.dotfiles  # reclone dotfiles.git folder
```
open config.json to better understand !

so while you're here... check [my dotfiles](github.com/mirsella/dotfiles)
don't hesitate to ask any question, i'll be happy to hear them <3

<h3>options</h3>

i put this at the end since nobody is gonna use it : 
the option you can specify backupscript.sh with, those are in the script it self and can be customized/added pretty easily with some shell scripting knownledge.
```
--curl <url>  # curl config.json from a URL
-l path/to/file.json   # use a specific local config file
-f  # add -f to gitF push
-c  # don't add -m to gitF commit
-m "commit message"   # specify git commit message. parentheses are important !
--export var123test  # export var123test = 1, accessible through config.json's command. be creative

# thoses are used in gitF push or can be acessed in config.json's command.
-b branch # git push to a specific branch
-o origin # git push to a specific origin
```

gitF is function in backupscript.sh. see example in config.json :
```
A  # git add -A
commit  # git commit -m "backupscript $(date)" # -m not used here if -c or -m
push  # git push ${gitF_force:-} ${gitF_remote:-} ${gitF_branch:-} 
checkout branch # git checkout branch
```
