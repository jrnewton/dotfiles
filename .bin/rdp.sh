#!/bin/sh
machine=columbia
xfreerdp /d:atlas /u:jnewton /p:`secret-tool lookup machine $machine` /v:$machine.local /cert:ignore /f /smart-sizing
