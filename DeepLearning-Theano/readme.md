In this files are all the results of DeepLearning Tutorials of Theano:

https://github.com/lisa-lab/DeepLearningTutorials

THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python Theano-demo.py

THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python Theano-demo.py

Code files
--------------

- 1.Logistic Regression: 

	logistic_sgd.py: stochastic gradient descent 

	logistic_cg.py: conjugate gradient descent

- 2.Multilayer perception: mlp.py

- 3.Deep Convolution Network: convolutional_mlp.py

- 4.Denoising Autoencoders (dA): dA.py

- 5.Stacked Denoising Autoencoders (SdA): SdA.py

- 6.Restricted Boltzmann Machines (RBM): rbm.py

- 7.Deep Belief Networks: DBN.py

- 8.HMC Sampling: /hmc/test_hmc.py

- 9.Contractive auto-encoders: cA.py

- 10.Recurrent Neural Networks with Word Embeddings: rnnslu.py

- 11.LSTM Networks for Sentiment Analysis: 

	imdb_preprocess.py, tokenizer.perl: used for create imdb.pkl and imdb.dict.pkl from data/aclImdb_v1.tar.gz, here we already have this pickled files for lstm.py

	lstm.py: Main script. Defines and train the model.

	imdb.py: Secondary script. Handles the loading and preprocessing of the IMDB dataset.

	run the code by calling: THEANO_FLAGS="floatX=float32" python lstm.py

- 12.Modeling and generating sequences of polyphonic music with the RNN-RBM: rnnrbm.py

- Other codes:

	test.py: test all the functions in this file

	utils.py: different utility functions

	data/download.sh: download all the datasets needed for the examples above

	data/aclImdb_v1.tar.gz(can be downloaded see imdb_preprocess.py): data for imdb_preprocess.py

	data/atis.*: data for rnnslu.py

	data/imdb.*: data for lstm.py

	data/midi.zip(code/midi/*), data/Nottingham: data for rnnrbm.py

	data/training_colorpatches_16x16_demo.mat:

In the folder /Result are the results for all the examples running both on CPU and GPU.
--------------

System settings for /Result:
--------------
Memory 7.8GB

CPU AMD FX(tm)-8150 Eight-Core Processor × 8 

GPU GeForce GTX 660 Ti/PCIe/SSE2

Ubuntu 14.04 LTS 64-bit

System settings for /Result/Result_rnnslu_cpu,Result_lstm_cpu:
-----------------
Memory 7,5 GiB

CPU Intel® Core™ i5-5300U CPU @ 2.30GHz × 4 

GPU Intel® HD Graphics 5500 (Broadwell GT2) 

Ubuntu 15.04 64-bit
