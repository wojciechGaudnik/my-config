#! /bin/bash

function customMount() {
	mount -t nfs -o soft $1 $2
	echo "on ---> $1 mounted in $2 at $(date)...">>/var/log/system_suspend_big.log
}

echo "on ---> awake $(date)...">>/var/log/system_suspend_big.log

systemctl start piavpn.service
echo "on ---> piavpn.service running $(date)...">>/var/log/system_suspend_big.log

customMount NAS:/mnt/NEW_DISKS/Plex /mnt/NAS_Plex
