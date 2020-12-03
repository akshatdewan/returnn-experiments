#!/bin/bash

set -ex
mydir=$(pwd)
#cd data/dataset_cased
#cd data/dataset_cased_cern_eu_libri_unesco_unog_wipo
#cd data/dataset_fr_cv_euparl-st_ilo
#cd data/dataset_cased_cern_eu-until2020_ilo_itu_libri_unesco_unog_wipo-2012-2019
cd data/dataset_fr_cv_euparl-st_euparlpost2018_ilo_unog
#test -s train-trans-all.txt || { $mydir/tools/collect-train-text.py > train-trans-all.txt; }
wc -l train-trans-all.txt
#test $(wc -l train-trans-all.txt | awk {'print $1'}) -eq 281241
#test $(wc -l train-trans-all.txt | awk {'print $1'}) -eq 798849

test -s trans.bpe.codes || $mydir/subword-nmt/learn_bpe.py --input train-trans-all.txt --output trans.bpe.codes --symbols 10000

test -s trans.bpe.vocab || python3 $mydir/subword-nmt/create-py-vocab.py --txt train-trans-all.txt --bpe trans.bpe.codes --unk "<unk>"  --out trans.bpe.vocab
