#!/usr/bin/bash
for i in {2..254}
do
	{
		ip=127.0.0.$i
		ping -c1 -W1 $ip &> /dev/null
		if [ $? -eq 1 ]; then
			echo "$ip is up"
		else
			echo "$ip is donw"
		fi
	}&
done
wait
echo "all finsh"
