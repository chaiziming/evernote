#!/usr/bin/bash
back_dir=/var/mysql_back
#if ! test -d $back_dir; then
#	mkidr -p $back_dir	
#fi

#if [ ! -d $back_dir ]; then
#	mkdir -p $back_dir
#fi

#if [ $UID -ne 0 ]; then
#	echo "not permmision"
#	exit
#fi

read -p "input a num: " num
if [[ $num =~ ^[0-9]+$ ]];then
	echo "is num"
else
	echo "not a num"
fi
