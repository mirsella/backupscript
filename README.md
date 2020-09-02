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

there is one argument you can provide backupscript : `-e` with it you can export value in script.
ex : 
```
b -e branch=main <your command name>
b -e push=-f <your command name>
b -e opt <your command name>
```
if you con't provide a equal sign, the value will be set to "1"

