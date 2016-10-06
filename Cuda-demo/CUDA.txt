//compile

nvcc benchmark-cublas.cu -std=c++11 -lcublas -o benchmark.out

//run

./benchmark.out 

//result

XNOR GEMM kernel time: 0.304656 s

GEMM kernel time: 5.66174 s

cublas time: 0.772158 s

success: 1

success: 1


