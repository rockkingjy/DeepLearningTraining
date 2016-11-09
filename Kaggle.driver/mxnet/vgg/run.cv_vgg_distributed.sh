for batch in 1 2 3 4 5
do
    python /home/i3/mxnet/tools/launch.py -n 3 --launcher ssh -H /home/i3/mxnet/hosts python train_vgg.py --train-dataset ./sf${batch}_train.rec --val-dataset ./sf${batch}_val.rec --model-prefix ./model/ckpt-${batch} --finetune-lr-scale 5 --kv-store dist_sync --batch-size 3
    #save the mean image
    cp mean.bin mean${batch}.bin
done
