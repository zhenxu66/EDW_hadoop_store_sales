#!/bin/bash
SRC_DIR=/user/training/project/EDW/staging
LOG_DIR=/home/training/exercises/project/sale/log

# remove existing directories 
hadoop fs -rm -R $SRC_DIR/dept $SRC_DIR/store $SRC_DIR/style $SRC_DIR/vendor

# load reference tables to staging area in hdfs.
sqoop  import --connect jdbc:mysql://localhost/MDM --table dept --username root --password root -m 1  --target-dir /user/training/project/EDW/staging/dept > $LOG_DIR/dept_`date`.log &
sqoop  import --connect jdbc:mysql://localhost/MDM --table vendor --username root --password root -m 1 --target-dir /user/training/project/EDW/staging/vendor
sqoop  import --connect jdbc:mysql://localhost/MDM --table style  --username root --password root -m 1 --target-dir /user/training/project/EDW/staging/style
sqoop  import --connect jdbc:mysql://localhost/MDM --table store  --username root --password root -m 1 --target-dir /user/training/project/EDW/staging/store
sqoop  import --connect jdbc:mysql://localhost/MDM --table sales  --username root --password root -m 1 --target-dir /user/training/project/EDW/staging/sales
