#!/bin/bash

docker run -v $PWD:$PWD -w $PWD -t genepattern/tfsites:0.9 python /build/tfsites-webportal/02-defineTfSitesPWM/02-defineTfSitesPWM.py -r /build/tfsites-webportal/02-defineTfSitesPWM/02-input_ets_raw_pfm_data.jaspar -b NNNGGAWNNN  -f 0.25,0.25,0.25,0.25  -p 1,1,1,1 -s FALSE -e FALSE -t 02-output_ets-norm-pwm.tsv -i 02-output_score-histograms.png


