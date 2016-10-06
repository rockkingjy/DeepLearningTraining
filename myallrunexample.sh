#mount
HOSTLIST="192.168.25.92 192.168.25.91"
for HOST in $HOSTLIST; do
	ssh $HOST 'sudo mount 192.168.25.70:/home/i3/mxnet /home/i3/mxnet'
done
echo 'All NFS mount finished!'
#run
cd ~/mxnet/example/image-classification
python /home/i3/mxnet/tools/launch.py -n 3 --launcher ssh -H /home/i3/mxnet/hosts python train_mnist.py --kv-store dist_sync

