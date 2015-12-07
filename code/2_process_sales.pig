
sales = load '$stage/sales' using PigStorage(',') as (transdate:int,store_id:int,dept:int,vendor:int, style:int, color:chararray, size:int, unit_price:double, sales_units:int, sales_dolrs:double);

sales_good = filter sales by sales_units>0;

sales_dedup = distinct sales_good;

sales_order = order sales_dedup by transdate;

fs -rmr $target/sales

store sales_order into '$target/sales' using PigStorage(',');

