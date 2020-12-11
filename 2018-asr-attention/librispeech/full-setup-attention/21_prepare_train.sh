#!/bin/bash

set -exv

# not much to be prepared

#test -d data/exp-returnn-cased || mkdir data/exp-returnn-cased
#test -d data/exp-cased_cern_eu_libri_unesco_unog_wipo_asr || mkdir data/exp-cased_cern_eu_libri_unesco_unog_wipo_asr
#test -d data/exp-wipo.base2.conv2l.specaug.curric3  || mkdir data/exp-wipo.base2.conv2l.specaug.curric3
test -d data/exp_fr_cv_euparl-st_euparlpost2018_ilo_unog/ || mkdir data/exp_fr_cv_euparl-st_euparlpost2018_ilo_unog/
