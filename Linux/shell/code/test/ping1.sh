#!/usr/bin/bash
#ip=192.168.0.1
#read -p "input: " ip 
#if ping -c1 -W1 $ip &> /dev/null; then
#	echo "$ip is up"
#else
#	echo "$ip is down"
#fi

#ping -c1 -W1 $ip &> /dev/null
#
#if [ $? -eq 0 ]; then
#	echo "$ip is up"
#else
#	echo "$ip is down"
#fi

#ping -c1 -W1 $1 &>/dev/null
#
#if [ $? -eq 0 ]; then
#	echo "$1 is up"
#else
#	echo "$1 is down"
#fi


#echo '$*='$*
#echo '$@='$@
#echo ${#*}
#echo ${#@}

#if [ $# -ne 0 ]; then
#	echo "usage: `basename $0` file $*| $@"
#fi

ip=192.169.1.22
i=1

while [ $i -le 5 ]
do
	ping -c1 $ip &> /dev/null 
	if [ $? -eq 0 ];then
		echo "$ip is up"
	fi
	
	let i++
done










