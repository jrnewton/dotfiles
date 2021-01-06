#!/bin/bash

mkdir /tmp/ramdisk
sudo mount -t tmpfs -o size=34G ramdisk /tmp/ramdisk
#sudo umount /tmp/ramdisk/
