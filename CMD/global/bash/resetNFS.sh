#!/usr/bin/env bash
top -b1 -n1|grep Z
sleep 5
ps -A -ostat,ppid|grep -e '[zZ]'|awk '{print $2}'|uniq|xargs ps -p
