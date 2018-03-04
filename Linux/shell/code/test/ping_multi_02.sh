#!/usr/bin/bash

> run/ip.txt
thread=5
tmp_fifo_file=/tmp/$$.fifo

mkfifo $tmp_fifo_file
exec 8<> $tmp_fifo_file
rm $tmp_fifo_file

for i in `seq $thread` 
do
	echo >&8	
done

for i in {2..254}
do
	read -u 8
	{
		ip=192.168.1.$i
		ping -c1 -W1 $ip &> /dev/null
		if [ $? -eq 1 ]; then
			echo "$ip is up" | tee -a run/ip.txt
		else
			echo "$ip is donw"
		fi
		echo >&8
	}&
done
wait
exec 8>&-
echo "all finsh"
