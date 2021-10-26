#!/bin/bash

# use -a option to enable atrous

TF_INC=$(python -c "import tensorflow as tf; print(tf.sysconfig.get_include())")
TF_LIB=$(python -c "import tensorflow as tf; print(tf.sysconfig.get_lib())")

# non-atrous convolution
FILE_CUDA=tf_conv3p_naive_ctxmem
FILE_CPU=tf_conv3p_grid

FLAGS=
while getopts ":a" opt; do
  case $opt in
    a)
    # atrous convolution
    FLAGS=-DATROUS=1
    FILE_CUDA=tf_conv3p_atrous
    FILE_CPU=tf_conv3p_atrous
    ;;
    \?) echo "Usage: cmd [-a]"
    ;;
  esac
done

# Both CUDA and CPU code in a single library: compile each implementation, and register op and link both into the same shared library
make CUDALIB=/usr/local/cuda/lib64/ CUDAINC=/usr/local/cuda/include TFINC=TF_INC TFLIB=TF_LIB FILE_CPU=FILE_CPU FILE_CUDA=FILE_CUDA FLAGS=FLAGS makefile
# Clean up
rm ${OUT}_cpu.o
rm ${OUT}_cuda.o