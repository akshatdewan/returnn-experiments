#!/bin/bash

set -exv

# You can run this already while it is still training.
# Run it a final time when the training is finished.

#experiment=cased_cern_eu_libri_unesco_unog_wipo_asr
#experiment=cased2_asr
#experiment=cased_cern_eu_libri_unesco_unog_wipo_asr
experiment=wipo.base2.conv2l.specaug.curric3
#test -e data/exp-$experiment  # experiment existing?
#experiment=attention-lm
#test -e data/exp-$experiment  # experiment existing?

# Get us some recommended epochs to do recog on.
#epochs=$(./tools/recommend-recog-epochs.py --experiment $experiment)
#epochs=$(./tools/recommend-recog-epochs.py --experiment $experiment)
#epochs=201 #cased_libri
epochs=28
extra_args="-- ++batch_size 5000"  # such that it fits on your GPU
#epochs=180
#extra_args="-- ++batch_size 5000"  # such that it fits on your GPU
#epochs=168
#extra_args="-- ++batch_size 2000"  # such that it fits on your GPU

#extra_args="-- ++batch_size 10000"  # such that it fits on your GPU
# In recog, sequences are sorted by length, to optimize the batch search padding.
# We start with the longest ones, to make sure the memory is enough.
for epoch in $epochs; do
  echo "recog of epoch $epoch"
  CUDA_VISIBLE_DEVICES=0 ./tools/search.py $experiment $epoch --data dev  $extra_args
done
