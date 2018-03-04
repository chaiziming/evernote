#!/usr/bin/bash
while read line
do
		
	hosts[i++]=$line

done < /etc/hosts

echo "hosts first: ${hosts[0]}"

old_ifs=$IFS
IFS=$'\n'

for i in ${!hosts[@]}
do
	echo "$i: ${hosts[$i]}"
done


for line in `cat /etc/hosts`
do
	hosts[i++]=$line
done

for i in ${!hosts[@]}
do
	echo "$i: ${hosts[i]}"	
done
IFS=$old_ifs
