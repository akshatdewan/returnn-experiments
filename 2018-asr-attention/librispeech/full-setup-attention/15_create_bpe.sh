#!/bin/bash

set -ex
mydir=$(pwd)
#cd data/dataset_cased
cd data/dataset_cased_cern_eu_libri_unesco_unog_wipo
#test -s train-trans-all.txt || { $mydir/tools/collect-train-text.py > train-trans-all.txt; }
wc -l train-trans-all.txt.tagged
#test $(wc -l train-trans-all.txt | awk {'print $1'}) -eq 281241
#test $(wc -l train-trans-all.txt | awk {'print $1'}) -eq 798849

test -s trans.bpe.codes.tagged || $mydir/subword-nmt/learn_bpe.py --input train-trans-all.txt.tagged --output trans.bpe.codes.tagged --symbols 10000

test -s trans.bpe.vocab.tagged || python3 $mydir/subword-nmt/create-py-vocab.py --txt train-trans-all.txt.tagged --bpe trans.bpe.codes.tagged --unk "<unk>"  --out trans.bpe.vocab.tagged
