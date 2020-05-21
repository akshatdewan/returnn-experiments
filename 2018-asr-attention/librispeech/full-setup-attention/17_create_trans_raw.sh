#!/bin/bash

set -exv
# This is just needed to calculate the final word-error-rate (WER).

#for prefix in dev-clean dev-other test-clean test-other train-clean train-other; do
#for prefix in test; do
#for prefix in  test_wipo test_cern test_unesco test_unog ; do
#    if test -s data/dataset_cased_cern_eu_libri_unesco_unog_wipo/$prefix.trans.raw; then
#      echo "$prefix exists already"
#      continue
#    fi
#
#    #./returnn/tools/dump-dataset-raw-strings.py --dataset "{'class':'LibriWipoEUCorpus', 'bpe':{'bpe_file':'data/dataset_cased/trans.bpe.codes', 'vocab_file':'data/dataset_cased/trans.bpe.vocab','unknown_label':'unk'}, 'path':'data/dataset_cased', 'audio':{}, 'prefix': '$prefix', 'use_zip': False}" --out data/dataset_cased/$prefix.trans.raw
#    ./returnn/tools/dump-dataset-raw-strings.py --dataset "{'class':'CernEULibriUnescoUnogWipoCorpus', 'bpe':{'bpe_file':'data/dataset_cased_cern_eu_libri_unesco_unog_wipo/trans.bpe.codes', 'vocab_file':'data/dataset_cased_cern_eu_libri_unesco_unog_wipo/trans.bpe.vocab', 'unknown_label':'unk'}, 'path':'data/dataset_cased_cern_eu_libri_unesco_unog_wipo', 'audio':{}, 'prefix': '$prefix', 'use_zip': False}" --out data/dataset_cased_cern_eu_libri_unesco_unog_wipo/$prefix.trans.raw
#
#done

for prefix in train dev; do
    if test -s data/dataset_ru/$prefix.trans.raw; then
      echo "$prefix exists already"
    continue
    fi
    ./returnn/tools/dump-dataset-raw-strings.py --dataset "{'class':'ruOpenSttCorpus', 'bpe':{'bpe_file':'data/dataset_ru/trans.bpe.codes', 'vocab_file':'data/dataset_ru/trans.bpe.vocab','unknown_label':'<unk>'}, 'path':'data/dataset_ru', 'audio':{}, 'prefix': '$prefix', 'use_zip': False}" --out data/dataset_ru/$prefix.trans.raw
done
