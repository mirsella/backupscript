<h1>a good backup is an easy backup</h1>
this one is painfull to setup, but after it's pretty neat.</br>
backupscript.sh loop through a json file, for the structure see the config.json.</br>
with my config.json it's setup so i can call it like :</br>
(b is a symlink in /bin/b to ~/.config/backupscript.sh)</br>
`b d`</br>
`b s d`</br>
`b update.s`</br>
`b t s d update.s update.d install.pkg install.script`</br>
you can give it multiple action in one line. see the config.json file, see by yourself it's better than a bad explanation.</br>
thoses arguments given to `backupscript.sh` without a dash `-` are in the config.json, it a "pack" of command.</br>
</br>
backupscript.sh itself have some options that have nothing to do with the json config. thoses can be easily tweaked in the script.</br>
help -h :</br>
`--curl <url>` : curl config.json from a URL</br>
`-l path/to/file.json` : use a specific local config file</br>
`-f` : use git push -f</br>
`-c` : simply use git commit without the -m "backupscript $(date)". -c will open a $EDITOR window to put a commit message.</br>
`-m "commit message"` : use git commit -m "commit message". parentheses are important !</br>
</br>
gitF is function in backupscript.sh. see example in config.json :</br>
`A` = git add -A</br>
`commit` = git commit -m "backupscript $(date)" # -m in not used if backupscript.sh is called with -c</br>
`push` = git push (-f is backupscript.sh is called with -f) (use gitF_remote if set. can be set with -r) (same but gitF_branch and with -b)</br>
`checkout <branch>` = git checkout</br>
</br>
those var are used in gitF push if set. or you can acess them in the json config.</br>
`-r <remote>` : change gitF_remote value</br>
`-b <branch>` : change gitF_branch</br>
