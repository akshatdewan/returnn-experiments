#!/bin/bash

set -exv

# Let this run in the background.
# Use 31b_demo.sh to record and recog something.

#epoch=$(./tools/report-best-recog.py --experiment $experiment --print_epoch_only)
mode=$1
echo $mode
if [[ $mode == long_segs ]]
then
    experiment=cased2_asr
    epoch=180
fi
if [[ $mode == short_segs ]]
then
    experiment=5s_segs
    epoch=250
fi
./returnn/rnn.py $experiment.config --task search_server ++load_epoch $epoch ++need_data 0 ++search_output_layer output
