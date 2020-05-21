#!/bin/bash

set -exv

# If you stop and rerun this, it will continue from the last epoch.
# All data (models, logs and train/dev scores) will be in data/exp-returnn.
# train/dev scores in particular are in the file data/exp-returnn/train-scores.data.
# That directory can also be monitored by TensorBoard.

#./returnn/rnn.py cased2_asr_multigpu.config
#./returnn/rnn.py cased_cern_eu_libri_unesco_unog_wipo_asr.config
#CUDA_VISIBLE_DEVICES=4 ./returnn/rnn.py cased_cern_eu_libri_unesco_unog_wipo_asr_domain_embedding_v2.config
#CUDA_VISIBLE_DEVICES=0 ./returnn/rnn.py wipo.base2.conv2l.specaug.curric3.config
CUDA_VISIBLE_DEVICES=1 ./returnn/rnn.py fr_cv_euparl-st_ilo.config
