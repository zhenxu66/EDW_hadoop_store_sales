#!/bin/bash
# exports data files from hdfs location to mysql db (please make sure the tables are created in mysql first)

sqoop export --connect jdbc:mysql://localhost/MDM --table dept  --username root --password root --export-dir  /user/training/project/EDW/source_data/dept.dat
sqoop export --connect jdbc:mysql://localhost/MDM --table vendor --username root --password root --export-dir  /user/training/project/EDW/source_data/vendor.dat
sqoop export --connect jdbc:mysql://localhost/MDM --table style --username root --password root --export-dir  /user/training/project/EDW/source_data/style.dat
sqoop export --connect jdbc:mysql://localhost/MDM --table store --username root --password root --export-dir  /user/training/project/EDW/source_data/store.dat
sqoop export --connect jdbc:mysql://localhost/MDM --table sales --username root --password root --export-dir  /user/training/project/EDW/source_data/sales.dat
