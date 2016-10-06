//run

cd ~/Theano-demo

THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python Theano-demo.py

THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python Theano-demo.py

//if ImportError: No module named theano

export PYTHONPATH=/usr/local/lib/python2.7/dist-packages/:$PYTHONPATH

//output:

$ THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python Theano-demo.py

[Elemwise{exp,no_inplace}(<TensorType(float32, vector)>)]
Looping 1000 times took 2.727354 seconds
Result is [ 1.23178029  1.61879337  1.52278066 ...,  2.20771813  2.29967761
  1.62323284]
Used the cpu

$ THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python Theano-demo.py

Using gpu device 0: GeForce GTX 660 Ti (CNMeM is disabled, cuDNN 4007)
[GpuElemwise{exp,no_inplace}(<CudaNdarrayType(float32, vector)>), HostFromGpu(GpuElemwise{exp,no_inplace}.0)]
Looping 1000 times took 0.543039 seconds
Result is [ 1.23178029  1.61879349  1.52278066 ...,  2.20771813  2.29967761
  1.62323296]
Used the gpu

