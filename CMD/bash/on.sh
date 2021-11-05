#! /bin/bash

function customMount() {
	mount -t nfs -o soft $1 $2
	echo "$(date) ---> on, $1 mounted in $2">>/var/log/system_suspend_big.log
}

echo "$(date) ---> on, awake">>/var/log/system_suspend_big.log

wakeonlan $OLD_MAC
echo "$(date) ---> on, wake signal to OLD sended">>/var/log/system_suspend_big.log

systemctl start piavpn.service
echo "$(date) ---> on, piavpn.service running">>/var/log/system_suspend_big.log

systemctl start piavpn.service
sleep 5
echo "$(date) ---> on, piavpn started at">>/var/log/system_suspend_big.log
piactl connect
echo "$(date) ---> on, piactl connected at">>/var/log/system_suspend_big.log

customMount NAS:/mnt/NEW_DISKS/Plex /mnt/NAS_Plex
