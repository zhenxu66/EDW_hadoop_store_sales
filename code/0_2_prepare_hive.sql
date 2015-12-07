SOURCE_DIR=/user/training/project/EDW/source_data

hive <<eof

use retail_prod;

create table if not exists product_dim(product_id int,dept_id int, dept_name string, vendor_id int, vendor_name string,
   style_id int, style_name string, color string, size int)
   row format delimited fields terminated by ',';

create table if not exists sales_fact(product_id int,trans_date int,store_id int,unit_price double, sales_units int,
  sales_dolrs double) row format delimited 
  fields terminated by ','; 

create table if not exists time_dim(trans_date int, week int, month int, year int)
  row format delimited 
  fields terminated by ',';
  
create table if not exists store_dim(store_id int, store_name String, address String, city String, state String)
  row format delimited 
  fields terminated by ',';

truncate table time_dim;

load data inpath '$SOURCE_DIR/time_dim.dat' into table time_dim;

quit;

eof

