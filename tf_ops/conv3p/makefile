CC=g++
NVCC=nvcc
CFLAGS="-std=c++11"
GFLAGS="-g -03"
LINKFLAGS="-lcudart -L"
TFLINKFLAGS="-ltensorflow_framework"
MPFLAG="-fopenmp"
CUDAFLAGS="-DGOOGLE_CUDA=1 -Xcompiler -fPIC -use_fast_math"

tf_conv3p.so: register_op.o tf_conv3p_cuda.o tf_conv3p_cpu.o
	$(CC) -shared -o tf_conv3p.so register_op.o tf_conv3p_cuda.o tf_conv3p_cpu.o $(LINKFLAGS) $(CUDALIB) -L$(TFLIB) $(TFLINKFLAGS) $(MPFLAG)

tf_conv3p_cpu.o: $(FILE_CPU).cpp
	$(CC) $(CFLAGS) -c $(FILE_CPU).cpp -o tf_conv3p_cpu.o -fPIC -I $(TFINC) $(GFLAGS) $(MPFLAG) -DCONV_OPENMP

tf_conv3p_cuda.o: $(FILE_CUDA).cu
	$(NVCC) $(CFLAGS) -c $(FILE_CUDA).cu -o tf_conv3p_cuda.o -c $(GFLAGS) $(CUDAFLAGS) -I $(CUDAINC) -I$(TFINC)

register_op.o: register_op.cpp
	$(CC) $(CFLAGS) -c register_op.cpp -o register_op.o -fPIC -I $(TFINC) $(GFLAGS) $(FLAGS)

clean:
	rm -f tf_conv3p_cpu.o tf_conv3p_cuda.o
