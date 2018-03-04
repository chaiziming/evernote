#!/usr/bin/bash

pass=111

if [ $# -eq 0 ];then
	echo "usage: `basename $0` file"
	exit 1
fi

if [ ! -f $1 ];then
	echo "error file"
	exit 2
fi

IFS=$'\n'

for line in `cat $1`
do
	if [ ${#line} -eq 0 ]; then
		continue
	fi
	
	user=`echo "$line"| awk '{print $1}'`
	pass=`echo "$line"| awk '{print $2}'`
	id "$user" &> /dev/null
	if [ $? -eq 0 ]; then
		echo "user $user already exists"
	else
		#useradd $user
		#echo "$pass" |passwd --stdin $user &> /dev/null
		#if [ $? -eq 0 ]; then
			echo "$user is created."
		#fi
	fi	
done
