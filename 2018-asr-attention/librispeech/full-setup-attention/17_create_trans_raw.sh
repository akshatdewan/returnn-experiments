#!/bin/bash

set -exv
# This is just needed to calculate the final word-error-rate (WER).

#for prefix in dev-clean dev-other test-clean test-other train-clean train-other; do
#for prefix in train dev; do
for prefix in test; do
    if test -s data/dataset_cased/$prefix.trans.raw; then
      echo "$prefix exists already"
      continue
    fi

    ./returnn/tools/dump-dataset-raw-strings.py --dataset "{'class':'LibriWipoEUCorpus', 'bpe':{'bpe_file':'data/dataset_cased/trans.bpe.codes', 'vocab_file':'data/dataset_cased/trans.bpe.vocab','unknown_label':'unk'}, 'path':'data/dataset_cased', 'audio':{}, 'prefix': '$prefix', 'use_zip': False}" --out data/dataset_cased/$prefix.trans.raw

done

wc -l data/dataset_cased/*.trans.raw

#test $(wc -l data/dataset/dev-clean.trans.raw | awk {'print $1'}) -eq 2705
#test $(wc -l data/dataset/dev-other.trans.raw | awk {'print $1'}) -eq 2866
#test $(wc -l data/dataset/test-clean.trans.raw | awk {'print $1'}) -eq 2622
#test $(wc -l data/dataset/test-other.trans.raw | awk {'print $1'}) -eq 2941
#test $(wc -l data/dataset/train-clean.trans.raw | awk {'print $1'}) -eq 132555
#test $(wc -l data/dataset/train-other.trans.raw | awk {'print $1'}) -eq 148690
