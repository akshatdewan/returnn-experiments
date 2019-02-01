#!/bin/bash

set -exv

# Running this is not mandatory.
# Or you can also break it in the middle.
# This is just for testing, whether the dataset was prepared correctly.
# For interactive terminals, you should see some progress bar like:
# 209/281241, 3:05:31 [ 0.07% ]

./returnn/tools/dump-dataset.py \
  "{'class':'LibriWipoEUCorpus', 'bpe':{'bpe_file':'data/dataset_cased/trans.bpe.codes', 'vocab_file':'data/dataset_cased/trans.bpe.vocab', 'unknown_label':'unk'}, 'path':'data/dataset_cased', 'audio':{'norm_mean':'data/dataset_cased/stats.mean.txt', 'norm_std_dev':'data/dataset_cased/stats.std_dev.txt'}, 'prefix': 'train', 'use_zip': False}" \
  --endseq -1 --type null

