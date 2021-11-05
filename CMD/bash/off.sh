#! /bin/bash
echo "off ---> we are off at $(date)...">>/var/log/system_suspend_big.log

function customUnmount() {
busy=true
while $busy
do
 if mountpoint -q "$1"
 then
	echo "off ---> $1 mounted at $(date)...">>/var/log/system_suspend_big.log
  umount "$1" 2> /dev/null
  if [ $? -eq 0 ]
  then
   busy=false
  else
   echo -n '.'  # output to show that the script is alive
   sleep 5      # 5 seconds for testing, modify to 300 seconds later on
  fi
 else
	echo "off ---> $1 not mounted at $(date)...">>/var/log/system_suspend_big.log
  busy=false
 fi
done
}

function customKill(){
	if pgrep $1; then
		pkill $1
		echo "off ---> $1 killed at $(date)...">>/var/log/system_suspend_big.log
	else
		echo "off ---> $1 not runned at $(date)...">>/var/log/system_suspend_big.log
	fi
}

customUnmount /mnt/NAS_Plex
customKill qbittorrent

piactl disconnect
systemctl stop piavpn.service

systemctl suspend

# function off(){
# 	pkill qbittorrent
# 	sleep 2
# 	doer /mnt/NAS_Plex
# 	systemctl suspend
# }
