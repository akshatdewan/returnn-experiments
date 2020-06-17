#!/bin/bash

set -exv

# You can run this already while it is still training.
# Run it a final time when the training is finished.

#experiment=cased_libri_asr
#experiment=cased2_asr
#experiment=cased_cern_eu_libri_unesco_unog_wipo_asr
#experiment=wipo.base2.conv2l.specaug.curric3
experiment=fr_cv_euparl-st_ilo
#experiment=ru

# Get us some recommended epochs to do recog on.
#epochs=$(./tools/recommend-recog-epochs.py --experiment $experiment)
#epochs=201 #cased_libri_asr
#epochs=28 
#epochs=180 # cased2_asr
#epochs=168 #cased_cern_eu_libri_unesco_unog_wipo_asr
#epochs=224 #ru
epochs=250 #fr_cv_euparl-st_ilo
extra_args="-- ++batch_size 8000"  # such that it fits on your GPU

# In recog, sequences are sorted by length, to optimize the batch search padding.
# We start with the longest ones, to make sure the memory is enough.
for epoch in $epochs; do
  echo "recog of epoch $epoch"
  CUDA_VISIBLE_DEVICES=3 ./tools/search.py $experiment $epoch --data demo  $extra_args
done
