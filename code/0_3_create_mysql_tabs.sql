# creates mysql tables
mysql -u root -p <<eof
create database if not exists MDM;
use MDM;
create table if not exists dept(dept_id integer,dept_name varchar(30));
create table if not exists vendor(vendor_id integer,vendor_name varchar(30));
create table if not exists style(style_id integer,style_name varchar(30));
create table if not exists store(store_id integer,store_name varchar(30),address varchar(30),city varchar(20),state varchar(2),store_type char(1));
create table if not exists sales(trans_date integer,store_id integer, dept int,vendor integer, style integer, color varchar(15), size integer,unit_price double,sales_units integer, sales_dolrs double);
quit;
eof
