#!/bin/bash

# set the environment 
#./setEnv.sh

STAG_DIR=/user/training/project/EDW/staging
TRG_DIR=/user/training/project/EDW/ext
SCRIPT_DIR=/home/training/exercises/project/sale/build

pig -b -param stage=$STAG_DIR -param target=$TRG_DIR -f $SCRIPT_DIR/process_sales.pig

pig -b -param stage=$STAG_DIR -param target=$TRG_DIR -f $SCRIPT_DIR/deduplicate.pig
