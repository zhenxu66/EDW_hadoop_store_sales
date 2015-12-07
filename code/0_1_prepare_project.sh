#!/bin/bash

# Create staging directories

 hadoop fs -mkdir /user/training/project
 hadoop fs -mkdir /user/training/project/EDW
 hadoop fs -mkdir /user/training/project/EDW/source_data
 hadoop fs -mkdir /user/training/project/EDW/staging
 hadoop fs -mkdir /user/training/project/EDW/ext
 hadoop fs -mkdir /user/training/project/EDW/ext/sales
 hadoop fs -mkdir /user/training/project/EDW/ext/dept
 hadoop fs -mkdir /user/training/project/EDW/ext/vendor
 hadoop fs -mkdir /user/training/project/EDW/ext/style
 hadoop fs -mkdir /user/training/project/EDW/ext/store
 hadoop fs -mkdir /user/training/project/EDW/ext/time_dim
 hadoop fs -mkdir /user/training/project/EDW/output


#copy data files to source_data folder

for i in /home/training/exercises/project/sale/sale_data/*.dat
do
 hadoop fs -put -f $i /user/training/project/EDW/source_data
done

# create stage and prod databases in hive

hive -e 'create database if not exists retail_stage;'
hive -e 'create database if not exists retail_prod;'

