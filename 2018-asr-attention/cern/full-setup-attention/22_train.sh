#!/bin/bash

set -exv

# If you stop and rerun this, it will continue from the last epoch.
# All data (models, logs and train/dev scores) will be in data/exp-returnn.
# train/dev scores in particular are in the file data/exp-returnn/train-scores.data.
# That directory can also be monitored by TensorBoard.

CUDA_VISIBLE_DEVICES=1 ./returnn/rnn.py cern2_asr.config
