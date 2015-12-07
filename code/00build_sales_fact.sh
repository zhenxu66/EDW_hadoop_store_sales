# This script builds transaction records for the sales data mart. It takes 2 arguments
if [[ $# -ne 3 ]];then 
  echo Usage: $0 transaction_count sleep output_file_name
  echo Example: $0 1000 0 sales.dat # for no sleep or no interval
  echo Example: $0 1000 1 sales.dat  # for sleep of 1 sec
  exit 0
fi

count=1

#removing old files
rm -f $3


# starting the loop 

while [ $count -le $1 ]
do

sleep $2

transdate=20140$(( $RANDOM % 9 ))$(( $RANDOM % 20+10))

sep=','


product_id=$(( $RANDOM % 10 + 100 ))
unit_price=$(( $RANDOM % 20 + 20 ))
sales_units=$(( $RANDOM % 10 + 2 ))
store=$(( $RANDOM % 8 + 2 ))
sales_dolrs=$(( $RANDOM % 70 + 50 ))

echo $product_id$sep$store$sep$transdate$sep$unit_price$sep$sales_units$sep$sales_dolrs>>$3
(( count++ ))
done
