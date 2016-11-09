im2rec_path=/home/i3/mxnet/tools/im2rec.py
#if no module named cv2, run: conda install opencv
python $im2rec_path sf ./train --list true --train-ratio 0.9 --recursive true 
python $im2rec_path sf_train.lst ./train --resize 224 --num_thread 4 --encoding .jpg 
python $im2rec_path sf_val.lst ./train --resize 224 --num_thread 4 --encoding .jpg 
python $im2rec_path sf_test.lst ./train --resize 224 --num_thread 4 --encoding .jpg
