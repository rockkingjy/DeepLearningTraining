#HOSTLIST="192.168.25.40 192.168.25.92 192.168.25.31 192.168.25.43 192.168.25.91 192.168.25.89 192.168.25.20 192.168.25.88 192.168.25.83"
HOSTLIST="192.168.25.92 192.168.25.91"
for HOST in $HOSTLIST; do
	ssh $HOST 'sudo reboot'
done

sudo reboot
