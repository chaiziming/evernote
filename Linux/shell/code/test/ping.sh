#!/usr/bin/bash

>ip.txt

for i in {2..254}
do
	{
		ip=192.168.1.$i
		ping -c1 -W1 $ip &>/dev/null
		if [ $? -eq 0 ];then
			echo "$ip" | tee -a run/ip.txt
		fi
	}&
done
wait
echo "finish..."
