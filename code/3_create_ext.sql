
TRG_DIR=/user/training/project/EDW/ext

hive <<eof
use retail_stage;

create external table  if not exists dept_stage(dept_id int,dept_name string)
row format delimited 
fields terminated by ','
location '${TRG_DIR}/dept';

create external table  if not exists vendor_stage(vendor_id int,vendor_name string)
row format delimited 
fields terminated by ','
location '${TRG_DIR}/vendor';

create external table  if not exists style_stage(style_id int,style_name string)
row format delimited 
fields terminated by ','
location '${TRG_DIR}/style';

create external table  if not exists store_stage(store_id int,store_name string,address string,
city string, state string, store_type string)
row format delimited 
fields terminated by ','
location '${TRG_DIR}/store';

create external table  if not exists sales_stage(trans_date int,store_id int, dept int, vendor int, style int, color string,
size int, unit_price double, sales_units int, sales_dolrs double)
row format delimited 
fields terminated by ','
location '${TRG_DIR}/sales';

eof
