#!/bin/bash

set -ex

export LC_ALL='en_US.UTF-8'

mydir=$(pwd)
#cd data/dataset_cased
#cd data/dataset_cased_cern_eu_libri_unesco_unog_wipo
cd data/dataset_fr_cv_euparl-st_ilo
test -s stats.mean.txt && test -s stats.std_dev.txt && echo "stats.*.txt files already exist, exit" && exit

# 'seq_ordering':'random' just to have a better estimate of remaining time.
# Takes around 10h for me.
# bpe stuff not really needed here, just to make it load.

#$mydir/returnn/tools/dump-dataset.py \
#  "{'class':'LibriSpeechCorpus', 'bpe':{'bpe_file':'trans.bpe.codes', 'vocab_file':'trans.bpe.vocab'}, 'path':'.', 'audio':{}, 'prefix': 'train', 'use_zip': True, 'seq_ordering':'random'}" \
#  --endseq -1 --type null --dump_stats stats
#$mydir/returnn/tools/dump-dataset.py \
#  "{'class':'LibriWipoEUCorpus', 'bpe':{'bpe_file':'trans.bpe.codes', 'vocab_file':'trans.bpe.vocab', 'unknown_label':'unk'}, 'path':'.', 'audio':{}, 'prefix': 'train', 'use_zip': False, 'seq_ordering':'random'}" \
#  --endseq -1 --type null --dump_stats stats

#$mydir/returnn/tools/dump-dataset.py \
#  "{'class':'CernEULibriUnescoUnogWipoCorpus', 'bpe':{'bpe_file':'trans.bpe.codes', 'vocab_file':'trans.bpe.vocab', 'unknown_label':'unk'}, 'path':'.', 'audio':{}, 'prefix': 'train', 'use_zip': False, 'seq_ordering':'random'}" \
#  --endseq -1 --type null --dump_stats stats

#test -s stats.mean.txt && test -s stats.std_dev.txt

$mydir/returnn/tools/dump-dataset.py \
  "{'class':'ruOpenSttCorpus', 'bpe':{'bpe_file':'trans.bpe.codes', 'vocab_file':'trans.bpe.vocab', 'unknown_label':'<unk>'}, 'path':'.', 'audio':{}, 'prefix': 'train', 'use_zip': False, 'seq_ordering':'random'}" \
  --endseq -1 --type null --dump_stats stats
test -s stats.mean.txt && test -s stats.std_dev.txt

#$mydir/returnn/tools/dump-dataset.py \
#  "{'class':'SpecAugFrCorpus', 'bpe':{'bpe_file':'trans.bpe.codes', 'vocab_file':'trans.bpe.vocab', 'unknown_label':'<unk>'}, 'path':'.', 'audio':{}, 'prefix': 'train', 'use_zip': False, 'seq_ordering':'random'}" \
#  --endseq -1 --type null --dump_stats stats
#test -s stats.mean.txt && test -s stats.std_dev.txt
