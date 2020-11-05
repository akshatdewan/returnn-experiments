#!/bin/bash

set -exv

# Let this run in the background.
# Use 31b_demo.sh to record and recog something.

#epoch=$(./tools/report-best-recog.py --experiment $experiment --print_epoch_only)
default_port=12380
default_msglen=80000
default_mode=long_segs
mode=${1:-$default_mode}
msglen=${2:-$default_msglen}
port=${3:-$default_port}

echo $mode
if [[ $mode == long_segs ]]
then
    #experiment=cased2_asr
    #epoch=180
    experiment=cased_cern_eu_libri_unesco_unog_wipo_asr
    epoch=168
fi

if [[ $mode == short_segs ]]
then
    experiment=5s_segs
    epoch=250
fi
CUDA_VISIBLE_DEVICES=3 ./returnn/rnn.py $experiment.config --task search_server ++load_epoch $epoch ++need_data 0 ++search_output_layer output ++port $port ++msglen $msglen
