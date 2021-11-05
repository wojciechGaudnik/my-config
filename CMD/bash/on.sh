#! /bin/bash

function customMount() {
	mount -t nfs -o soft $1 $2
	echo "on ---> $1 mounted in $2 at $(date)...">>/var/log/system_suspend_big.log
}

echo "on ---> awake $(date)...">>/var/log/system_suspend_big.log

wakeonlan $OLD_MAC
echo "on ---> wake signal to OLD sended at$(date)...">>/var/log/system_suspend_big.log

systemctl start piavpn.service
echo "on ---> piavpn.service running $(date)...">>/var/log/system_suspend_big.log

systemctl start piavpn.service
sleep 2
echo "on ---> piavpn started at $(date)...">>/var/log/system_suspend_big.log
piactl connect
echo "on ---> piactl connected at $(date)...">>/var/log/system_suspend_big.log

customMount NAS:/mnt/NEW_DISKS/Plex /mnt/NAS_Plex
