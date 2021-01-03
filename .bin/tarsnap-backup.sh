#!/bin/bash
/usr/bin/tarsnap -c -f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" /home/jnewton
