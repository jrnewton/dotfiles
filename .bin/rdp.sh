#!/bin/sh
# store password with:
# secret-tool store --label='RDP password' machine columbia
#machine=columbia
#machine=jonesboro
machine=jacksonville
xfreerdp /d:atlas /u:jnewton /p:`secret-tool lookup machine $machine` /v:$machine.local /cert:ignore /f /smart-sizing
