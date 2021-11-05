#! /bin/bash
echo "$(date) ---> off, we are off">>/var/log/system_suspend_big.log

function customUnmount() {
busy=true
while $busy
do
 if mountpoint -q "$1"
 then
	echo "$(date) ---> off, $1 mounted">>/var/log/system_suspend_big.log
  umount "$1" 2> /dev/null
  if [ $? -eq 0 ]
  then
   busy=false
  else
   echo -n '.'
   sleep 5
  fi
 else
	echo "$(date) ---> off, $1 not mounted">>/var/log/system_suspend_big.log
  busy=false
 fi
done
}

function customKill(){
	if pgrep $1; then
		pkill $1
		echo "$(date) ---> off, $1 killed">>/var/log/system_suspend_big.log
	else
		echo "$(date) ---> off, $1 not runned">>/var/log/system_suspend_big.log
	fi
}

customUnmount /mnt/NAS_Plex
customKill qbittorrent

piactl disconnect
echo "$(date) ---> off, piactl disconnected">>/var/log/system_suspend_big.log
systemctl stop piavpn.service
echo "$(date) ---> off, piavpn stoped">>/var/log/system_suspend_big.log

echo "$(date) ---> off, last step systemctl suspend">>/var/log/system_suspend_big.log
systemctl suspend
