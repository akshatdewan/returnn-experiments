#!/bin/bash

set -exv

# Running this is not mandatory.
# Or you can also break it in the middle.
# This is just for testing, whether the dataset was prepared correctly.
# For interactive terminals, you should see some progress bar like:
# 209/281241, 3:05:31 [ 0.07% ]

./returnn/tools/dump-dataset.py \
  "{'class':'CernCorpus', 'bpe':{'bpe_file':'data/dataset_cern1/trans.bpe.codes', 'vocab_file':'data/dataset_cern1/trans.bpe.vocab', 'unknown_label':'unk'}, 'path':'data/dataset_cern1', 'audio':{'norm_mean':'data/dataset_cern1/stats.mean.txt', 'norm_std_dev':'data/dataset_cern1/stats.std_dev.txt'}, 'prefix': 'dev', 'use_zip': False}" \
  --endseq -1 --type null

