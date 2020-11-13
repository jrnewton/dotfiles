I don't currently use any plugins.  Here are some notes on what I've tried in the past. 

# Plugins I like
* CVSconflict (vimdiff on CVS conflict markers) - I've learned to read conflicts inline.
* DirDiff (recursive vimdiff on dirs) - might use again if I don't have something like WinMerge.
* abbreviations.vim - good but didn't use a lot.
* asynccommand - good but not needed with Vim 8+.
* autoload_cscope, taglist - great for C programming but I don't do that anymore :) 
* fugitive.vim (git) - I always tend to fall back to command line ```git status``` and such.
* mru - can use the builtin ```:browse filter```
* json - (filetype) better syntax highlighting.  Now use VSCode when wrangling big JSON files. 

# Liked them but took out to slim down
* netrw (bleeding edge not needed with Vim 8)
* fontsize (change font size) - use Edit > Select Font option
* vcs plugin - command line is good enough.
* NrrwRgn (narrow region)
* NERDTree - the builtin explorer and autocomplete under e: was good enough. 
* CtrlP - great but found I could live with built-in functions (:find)
* gitv - gitk with a proper UI for the win.

# Wasted time
* Solarized - looks crappy on RDP.
* Unite - had a bit better perf than CtrlP but doc was meh, and now CtrlP has buffer and mru support AND ctags support (plus it has zero dependencies and does not require C compile).
* ConqueTerm  - issues with switching buffers and switch insert/normal mode. sigh. it also really needs to have lcd follow the shell pwd.
* LargeFile - actually broke large file editing on one large customer dataset. 
