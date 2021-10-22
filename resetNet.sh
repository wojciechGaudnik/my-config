echo "Reset net...."
modprobe -r atlantic
sleep 5
echo "Unloaded ..."
modprobe -i atlantic
echo "Loaded"
