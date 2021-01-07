#!/bin/bash
/usr/bin/tarsnap -c -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
  /home/jnewton/backup \
  /home/jnewton/code \
  /home/jnewton/Desktop \
  /home/jnewton/Documents \
  /home/jnewton/ghdev \
  /home/jnewton/Music \
  /home/jnewton/Pictures \
  /home/jnewton/Public \
  /home/jnewton/Templates \
  /home/jnewton/Videos
