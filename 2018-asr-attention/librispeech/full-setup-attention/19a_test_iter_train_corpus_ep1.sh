#!/bin/bash

set -exv

# Running this is not mandatory.
# Or you can also break it in the middle.
# This is just for testing, whether the dataset was prepared correctly.
# This will use the training config and iterate through epoch 1.
# For interactive terminals, you should see some progress bar like:
# 353/822, 0:00:04 [|||....]

#./returnn/tools/dump-dataset.py returnn.config --endseq -1 --type null
#./returnn/tools/dump-dataset.py uncased_asr.config --endseq -1 --type null
#./returnn/tools/dump-dataset.py cased_cern_eu_libri_unog_unesco_wipo_asr.config --endseq -1 --type null
#./returnn/tools/dump-dataset.py wipo.base2.conv2l.specaug.curric3.config --endseq -1 --type null
./returnn/tools/dump-dataset.py ru.config --endseq -1 --type null
#./returnn/tools/dump-dataset.py base2.conv2l.specaug.curric3.config --epoch 4 --endseq -1 --type null
#./returnn/tools/dump-dataset.py fr_cv_euparl-st_ilo.config --endseq -1 --type null
