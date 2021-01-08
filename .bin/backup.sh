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
# pid=$!
# echo "pid is $pid"
# while [ -d /proc/$pid ]; do
#   sleep 1
# done
# echo "status start"
# while true
# do
#   killall -SIGUSR1 tarsnap
#   retval=$?
#   echo "killall returned $retval"
#   if [ $retval -eq 1 ]; then
#     echo "status end"
#     exit
#   fi
#   sleep 3
# done
