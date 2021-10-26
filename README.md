# Pointwise Convolutional Neural Networks

This repository is not an original implementation of the work, but a refactored codebase for the paper `Pointwise Convolutional Neural Networks' in CVPR 2018. 

#Team

Anton Zubeknin, Georgy Mkrtchyan, Vadim Artemov

## Structure

‘data’ is a folder with a link to the dataset for neural network training. The required data is also downloaded there.

‘tf_ops/conv3p’ contains ‘.cpp’ and ‘.cu’ files for a custom convolution operator, which is implemented with C++ and CUDA.

‘Dockerfile’ is required to build a docker image to run this code in a container.

The ModelNet40 neural network is implemented in files ‘pointcnn2_acsd.py’, ‘modelnet_provider.py’; ‘selu.py’ and ‘util.py’ contain additional methods for neural network initialization and running.

Python scripts ‘train_modelnet40_acsd.py’ and ‘eval_modelnet40_acsd.py’ perform training and evaluating the model.

JSON-file ‘param.json’ contains parameters for ModelNet40 initialization. You can change them there for your setup.

Python script ‘model_testing.py’ performs additional unit tests for neural network.

The shell scripts help to automate building and running process.


## Usage

To run the code we need to execute shell scripts as following:

To run the docker container in the first place we need ‘docker-ce’ and ‘nvidia-docker’ in the host:
	
bash install_docker.sh

Then, we proceed with building docker image according to procedures stated in the ‘Dockerfile’. Shell script ‘build_docker.sh’ does that:

	bash build_docker.sh

Next, we should run the builded docker image:

	bash run_docker.sh

FInally, we can run the neural network in the container with

	bash run_container.sh

‘run_container.sh’ downloads the necessary dataset for ModelNet40 with the script ‘download.sh’, then the required custom convolution operator is builded with ‘tf_ops/conv3p/compile.sh’. 

The building of the original ‘.cpp’ and ‘.cu’ files is done with help of corresponding ‘makefile’. 

Finally, after everything is downloaded and compiled, ‘exec_train_modelnet40_acsd.sh’ is run to train the ModelNet40 network and ‘exec_eval_modelnet40_acsd.sh’ for evaluating it.

## Citation 

Please cite [original paper](https://arxiv.org/abs/1712.05245).
  
    @inproceedings{hua-pointwise-cvpr18,
        title = {Pointwise Convolutional Neural Networks},
        author = {Binh-Son Hua and Minh-Khoi Tran and Sai-Kit Yeung},
        booktitle = {Computer Vision and Pattern Recognition (CVPR)},
        year = {2018}
    }




