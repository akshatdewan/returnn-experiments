#!/bin/bash

set -exv

# You can run this already while it is still training.
# Run it a final time when the training is finished.

experiment=cern_asr
#test -e data/exp-$experiment  # experiment existing?

# Get us some recommended epochs to do recog on.
#epochs=$(./tools/recommend-recog-epochs.py --experiment $experiment)
extra_args="-- ++batch_size 2000"  # such that it fits on your GPU

# In recog, sequences are sorted by length, to optimize the batch search padding.
# We start with the longest ones, to make sure the memory is enough.
epochs=232 #,244,219,180,170,099
for epoch in $epochs; do
  echo "recog of epoch $epoch"
  CUDA_VISIBLE_DEVICES=2 ./tools/search.py $experiment $epoch  --data dev $extra_args
done
