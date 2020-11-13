See also: 
http://ontwik.com/vim-from-novice-to-professional-by-derek-wyatt-part-2/

# Netrw
```
%                     create a new file
d                     create a new directory
R                     rename the file/directory under the cursor
D                     Delete the file/directory under the cursor
o                     open file in horiz split window
v                     open file in vert split window
```

# Key Shortcuts
```
:map <key>            display mapping for <key>
<F3>                  :TlistToggle
<F4>                  :copen
<Leader>l             scroll lock
<Leader>w             wrap
<Leader>c             find CVS conflicts
<Leader><Leader>0     reset fontsize
[q, ]q, [Q, ]Q        quick fix nav
```

# ctags
```
CTRL-]
:lt                   load current match set into location list window.
:lt                   <match> search for tag and put results into location list window.
:tnext and :tprev     will send you to the next and previous tag in the list, respectively.
:tselect              will display the tag list and let you choose one with a number.
:lopen                view the location list window.
```

# Navigation
```
ctrl-y                scroll window upwards
ctrl-e                scroll window downwards
ctrl-] / ctrl-t       follow tag / return
ctrl-i                next cursor position (in level)
ctrl-o                prev cursor position (out level)
``                    before last jump
zs                    horiz scroll to cursor
zt                    put line at top
zb                    put line at bottom
zz                    put line at middle
H                     put cursor at top (High)
M                     put cursor at middle
L                     put cursor at bottom (Low)
```

# Window Management
```
CTRL-W=3D             each window gets equal space
:botright sp          new horizontal split at bottom of screen, acros=
s all vert splits
:topleft  sp          new horizontal split at top of screen, across a=
ll vert splits
```

# Spelling
]s                    next bad word
[s                    prev bad word
z=3D                  suggestion
zg                    add word

# Folds
```
[v]zf                 create fold
zo/O                  open
zc/C                  close
zd/D                  delete
za/A                  toggle
zE                    eliminate all
```

# Search/Regex/Global
```
*, {-}                *, *?
+, {-1,}              +, +?
=3D                   ?
\zs \ze               start / end the match here
/v                    very magic
//b+5                 begin of search + 5
//e+5                 end of search + 5
fc                    search line for 'c'
2fc                   search for 2nd occurrence of 'c'
:grep -i foo *
:lgrep -i foo *       then lopen to see results
:g/<pattern>/d        delete all lines with pattern
:g!/<pattern>/d       delete all lines not matching pattern
:g/<pattern>/normal <C-V><C-A>
<C-A> / <C-X>         add / subtract from number on line
```

# Macros
```
qa                    record macro into 'a' register
q                     stop record
@a                    play macro in 'a' register
@@                    play last macro
```

# Registers
```
"ayy                  yank into 'a' register
"ap                   paste 'a' register
"0p                   paste last yank
"1p                   paste last delete
```

# Shell
```
<sel>!                    run selected range through exec
:!                        exec
!!                        exec, output to buffer
i_CTRL-R=3Dsystem("ls")   dump output of 'ls' into buffer
```

# MRU Files
```
:[ol]dfiles
:[bro]wse filter /<pattern>/ ol
```

# Random
```
vwU                   uppercase word
vwu                   lower case word
~                     switch case of char
gv                    select last selection
CTRL-v                visual block mode
<sel>J                join lines
<sel>gJ               join lines, no spaces
=3D<motion>           Filter lines through 'equalprg', by default will do C-indenting
{visual}gq            format selection
:args <wildcard>      load files matching <wildcard>
:r                    read contents into current buffer.
i_CTRL_p/i_CTRL_n     autocomplete word based on buffer, when in insert mode
i_CTRL_v              insert raw character
i_CTRL_x CTRL-f       insert file path
SHIFT_i               insert windows clipboard into cmdline
q:                    open command-line window
q/                    open command-line window for search string
c_CTRL-f              when in command-line, open in window
```
