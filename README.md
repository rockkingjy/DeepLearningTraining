Choose and install operating system
====================================================================
make a wince usb stick setup

on the start up of the computer choose "usb-hdd"

use wince to delete the disc that is for old linux

use wince to recover MBR table

//CUDA only work for 64 bit version,so use 64 bit ubuntu 14.0, not 16.0--too new for cuda

ubuntu usb stick install choose "usb-hdd"

Set proxy -- proxy.cergy.eisti.fr 3128
====================================================================
export http_proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128

export https_proxy=https://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128

export ftp_proxy=ftp://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128

export socks_proxy=socks://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128

sudo apt-get update

####or run in terminal the file other/setproxy.py:

sudo python setproxy.py proxy.cergy.eisti.fr 3128 jinyan PASSWORD

sudo apt-get update

ssh settings for log on to other servers
====================================================================
####run on both server and client:

sudo apt-get install openssh-server

####run on client, setting for login without password:

ssh-keygen -t rsa

ssh i3@192.168.25.91 mkdir -p .ssh

cat ~/.ssh/id_rsa.pub | ssh i3@192.168.25.91 'cat >> .ssh/authorized_keys'

####run on client, try to login without password:

ssh 192.168.25.91

NFS setting
====================================================================
####server:

sudo apt install nfs-kernel-server

sudo vi /etc/exports

/home/i3/Documents/install 192.168.25.31/22(rw)

/home/i3/mxnet 192.168.25.31/22(rw)

#####------not persistent------------

sudo mount 192.168.25.70:/home/i3/mxnet /home/i3/mxnet

sudo mount 192.168.25.70:/home/i3/Documents/install /home/i3/Documents/install

//or:

sh myallmount.sh

#####-------persistent----------------

sudo vi /etc/fstab

192.168.25.70:/home/i3/mxnet /home/i3/mxnet nfs rw,soft,intr 0 0

192.168.25.70:/home/i3/Documents/install /home/i3/Documents/install nfs rw,soft,intr 0 0

sudo service nfs-kernel-server start

####client:

sudo apt install nfs-common

mkdir /home/i3/mxnet

mkdir /home/i3/Documents/install

mkdir /home/i3/Downloads/kaggle_statefarm-master

sudo mount 192.168.25.70:/home/i3/mxnet /home/i3/mxnet 

sudo mount 192.168.25.70:/home/i3/Documents/install /home/i3/Documents/install

sudo mount 192.168.25.70:/home/i3/Downloads/kaggle_statefarm-master /home/i3/Downloads/kaggle_statefarm-master

Shutdown all computer in one command:
====================================================================
####for every computer:

sudo visudo
####add:
i3 ALL = NOPASSWD:/sbin/poweroff, /sbin/shutdown, /sbin/reboot
####or:
i3 ALL=(ALL) NOPASSWD: ALL
####run:
sh other/myallshutdown.sh

Install python
====================================================================
sudo apt-get install python-numpy python-scipy python-dev python-pip python-nose g++ libopenblas-dev

blas
====================================================================
sudo apt-get install libatlas-base-dev

cuda
====================================================================
####clean the old driver

sudo apt-get --purge remove nvidia-*
####[download](https://developer.nvidia.com/cuda-downloads)

cp cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb  ..

sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb

sudo apt-get update

sudo apt-get install cuda
###add CUDA to path cd
####This change is not persistent and will need to be re-run each time you log in

export PATH=/usr/local/cuda-7.5/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=/home/i3/mxnet/python

####For persistent version here:?

sudo vi /etc/environment

//then add /usr/local/cuda-7.5/bin: to PATH in /etc/environment

sudo su

sudo echo "/usr/local/cuda-7.5/lib64" > /etc/ld.so.conf.d/cuda.conf

sudo echo "/home/i3/mxnet/python" > /etc/ld.so.conf.d/mxnet.conf

sudo ldconfig

sudo reboot

####GPU cuDNN setting

cd ~/Documents/install

tar xvzf cudnn-7.0-linux-x64-v4.0-prod.tgz

tar xvzf cudnn-7.5-linux-x64-v5.0-ga.tgz

sudo cp cuda/include/cudnn.h /usr/local/cuda-7.5/include/

sudo cp cuda/lib64/libcudnn* /usr/local/cuda-7.5/lib64/

sudo chmod a+r /usr/local/cuda-7.5/include/cudnn.h /usr/local/cuda-7.5/lib64/libcudnn*

####test CUDA installation:

nvidia-smi

cd /usr/local/cuda/samples/5_Simulations/nbody

sudo make

./nbody

####run Cuda demo see file ~/Cuda-demo

Opencv
====================================================================
sudo apt-get install build-essential

sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

//for use mxnet we have to use opencv-2.4

cp -r opencv-2.4.13.zip ..

cd ~/opencv

mkdir release

cd release

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

make

sudo make install

####run demo see file ~/Opencv-demo

Install Theano with proxy
====================================================================
sudo pip --proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128 install Theano

####run demo see fold ~/Theano-demo

Tensorflow
====================================================================
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl

sudo pip --proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128 install --upgrade $TF_BINARY_URL

//run a Tensorflow demo model

python -m tensorflow.models.image.mnist.convolutional

####Problem?:

if after install Torch, running Tensorfolw have errors: couldn't open cuda library cudnn,run this:
export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH

[Caffe](http://caffe.berkeleyvision.org/installation.html)
====================================================================
####download source from github

####test Caffe on MINST: http://caffe.berkeleyvision.org/gathered/examples/mnist.html

cd ~/Document/caffe-master

./data/mnist/get_mnist.sh

./examples/mnist/create_mnist.sh

./examples/mnist/train_lenet.sh

[Torch](http://torch.ch/docs/getting-started.html#_)
====================================================================
git clone https://github.com/torch/distro.git ~/Documents/torch --recursive

cd ~/Documents/torch; 

//because the proxy condition in eisti, before this command line:

//bash install-deps;

//should search file ~/torch/install-deps:

//sudo apt-get update 

//and change to:

//# sudo apt-get update

bash install-deps;

./install.sh

source ~/.bashrc

####test Torch

th

ipython 
====================================================================
https://jupyter.org/

Lasagne
====================================================================
pip --proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128 install Lasagne==0.1

pandas
====================================================================
pip --proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128 install pandas

scikit-learn
====================================================================
pip --proxy=http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128 install -U scikit-learn

mxNet
====================================================================
sudo apt-get update

sudo apt-get install -y build-essential git libatlas-base-dev libopencv-dev

USE_DIST_KVSTORE=1

make clean

make -j$(nproc)

cat > hosts

192.168.25.31

192.168.25.40

192.168.25.43 

192.168.25.91

192.168.25.92

192.168.25.89

192.168.25.20 

192.168.25.88

192.168.25.83

cd python; sudo python setup.py install

cd ~/mxnet/example/image-classification

python train_mnist.py --gpus 0

cd ~/mxnet/example/image-classification

python /home/i3/mxnet/tools/launch.py -n 3 --launcher ssh -H /home/i3/mxnet/hosts python train_mnist.py --kv-store dist_sync

cd ~/mxnet/example/model-parallel-lstm

python /home/i3/mxnet/tools/launch.py -n 2 --launcher ssh -H /home/i3/mxnet/hosts python lstm_ptb.py --kv-store dist_sync

git
==============================================
####git proxy setting -- when clone github, change git:// to http://
git config --global http.proxy http://jinyan:PASSWORD@proxy.cergy.eisti.fr:3128

git config --global user.name "rockkingjy"

git config --global user.email "rockking.jy@gmail.com"

git init selftrain.deeplearning

git remote add origin https://github.com/rockkingjy/selftrain.deeplearning.git

git push -u origin master

git add .

git commit -m "rearranged"

git push -u origin master

