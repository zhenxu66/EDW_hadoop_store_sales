hive <<eof
use retail_prod;

truncate table product_dim;

insert into table product_dim  
select concat(a.dept_id,b.vendor_id,c.style_id,s.size,(case s.color when 'black' then 1 when 'red' then 2 when 'white' then 3 when 'yellow' then 4 end )) as product_id,a.dept_id,a.dept_name,b.vendor_id,b.vendor_name,c.style_id,c.style_name,s.color as color,s.size as size from 
retail_stage.dept_stage a join retail_stage.sales_stage s on (a.dept_id=s.dept) join retail_stage.vendor_stage b
on (s.vendor=b.vendor_id) join retail_stage.style_stage c on (s.style=c.style_id)  ;

truncate table store_dim;

insert into table store_dim select store_id,store_name,address,city,state,store_type from retail_stage.store_stage;

drop table if exists sales_fact_temp;

create table sales_fact_temp as select b.product_id,s.trans_date,s.store_id,s.unit_price,s.sales_units,s.sales_dolrs
from retail_stage.sales_stage s join product_dim b on (concat(s.dept,s.vendor,s.style,s.size,(case s.color when 'black' then 1 when 'red' then 2 when 'white' then 3 when 'yellow' then 4 end ))=b.product_id);

truncate table sales_fact;

insert into table sales_fact select * from sales_fact_temp;
eof
