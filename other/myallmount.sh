HOSTLIST="192.168.25.92 192.168.25.91"
for HOST in $HOSTLIST; do
	ssh $HOST 'sudo mount 192.168.25.70:/home/i3/mxnet /home/i3/mxnet'
done

