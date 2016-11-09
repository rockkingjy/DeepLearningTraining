for batch in 1 2 3 4 5
do
    python /home/i3/mxnet/tools/launch.py -n 3 --launcher ssh -H /home/i3/mxnet/hosts python train_inception_bn.py --train-dataset ../sf${batch}_train.rec --val-dataset ../sf${batch}_val.rec --model-prefix ./model/ckpt-shuffle${batch}  --kv-store dist_sync --batch-size 9
    #save the mean image
    cp mean.bin mean-rand-shuffle${batch}.bin
done
