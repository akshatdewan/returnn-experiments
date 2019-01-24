#!/bin/bash

set -exv

# Let this run in the background.
# Use 31b_demo.sh to record and recog something.

experiment=cased_asr
#epoch=$(./tools/report-best-recog.py --experiment $experiment --print_epoch_only)
epoch=160
./returnn/rnn.py $experiment.config --task search_server ++load_epoch $epoch ++need_data 0 ++search_output_layer output
