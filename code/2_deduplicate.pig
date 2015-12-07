dept = load '$stage/dept/*';
dept_dedup = distinct dept;
fs -rmr $target/dept
store dept_dedup into '$target/dept' using PigStorage(',');

vendor = load '$stage/vendor/*';
vendor_dedup = distinct vendor;
fs -rmr $target/vendor
store vendor_dedup into '$target/vendor' using PigStorage(',');

style = load '$stage/style/*';
style_dedup = distinct style;
fs -rmr $target/style
store style_dedup into '$target/style' using PigStorage(',');

store = load '$stage/store/*';
store_dedup = distinct store;
fs -rmr $target/store
store store_dedup into '$target/store' using PigStorage(',');
