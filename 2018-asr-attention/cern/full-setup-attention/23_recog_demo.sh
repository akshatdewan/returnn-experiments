#!/bin/bash

set -exv

# You can run this already while it is still training.
# Run it a final time when the training is finished.
asr_type=$1

if [[ $asr_type = cern_asr ]] #v1
then
  experiment=cern_asr
fi
test -e data/exp-$experiment  # experiment existing?
#test -e data/exp-$experiment/train-scores.data  # some epochs trained?

extra_args="-- ++batch_size 10000"  # such that it fits on your GPU
# In recog, sequences are sorted by length, to optimize the batch search padding.
# We start with the longest ones, to make sure the memory is enough.

if [[ $asr_type = cern_asr ]] #v1
then
  epochs=232
fi

for epoch in $epochs; do
  echo "recog of epoch $epoch"
  ./tools/search.py $experiment $epoch --data demo $extra_args
done

