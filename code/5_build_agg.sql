hive <<eof
use retail_prod;

drop table if exists dept_store_agg;

--dept_store sum all sale unit and dolrs 
--Tables (sales_fact s) join (product_dim p) with groups
create table dept_store_agg as select s.trans_date, p.dept_id, p.dept_name, s.store_id, sum(s.sales_units) sales_units, sum(s.sales_dolrs) as sales_dolrs from sales_fact s join product_dim p where s.product_id=p.product_id group by s.trans_date, p.dept_id, p.dept_name, s.store_id;

drop table if exists store_month_agg;

--store_month_agg sum all month sales and price for each store
--Tables (sales_fact s) join (product_dim p) with groups
create table store_month_agg as select substr(s.trans_date,1,6) as yearmonth, s.store_id, sum(s.sales_units) sales_units, sum(s.sales_dolrs) as sales_dolrs from sales_fact s join product_dim p where s.product_id=p.product_id group by substr(s.trans_date,1,6), s.store_id;

drop table if exists vendor_month_agg;

--vendor_month_agg sum all month sales and price for each store
--Tables (sales_fact s) join (product_dim p) with groups
create table vendor_month_agg as select p.vendor_id, p.vendor_name, substr(s.trans_date,1,6) yearmonth, sum(s.sales_units) sales_units, sum(s.sales_dolrs) as sales_dolrs from sales_fact s join product_dim p where s.product_id=p.product_id group by p.vendor_id, p.vendor_name, substr(s.trans_date,1,6);

quit;

eof