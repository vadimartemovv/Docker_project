#!/usr/bin/bash

cd /usr/pointwise

bash ./tf_ops/conv3p/compile.sh

bash ./download.sh
bash ./train.sh
bash ./eval.sh
