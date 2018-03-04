#!/usr/bin/bash
#watch -n1 ./scrip_name
#ss -an | awk '{print $2}' | sort | uniq -c
while :
do
unset status
declare -A status

type=`ss -an | grep :80 | awk '{print $2}'`

for i in $type
do
	let status[$i]++
done

for j in ${!status[@]}
do
	echo "$j: ${status[$j]}"
done

done