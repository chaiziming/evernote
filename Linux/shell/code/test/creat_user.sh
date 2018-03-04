#!/usr/bin/bash
while :
do
	read -p "Please enter prefix & password & num: " prefix password num
	printf "user infomation:
	-----------------------------
	user prefix: $prefix
	user password: $password
	user num: $num
	-----------------------------
	"
	read -p "Are you sure?[y/n]" action

	if [ "$action" = "y" ]; then
		break
	fi
done

for i in `seq -w $num`
do
	user=$prefix$i
	id $user &> /dev/null
	if [ $? -eq 0 ];then
		echo "user $user already exists"	
	else
		useradd $user
		echo "$password" | passwd --stdin $user &> /dev/null
		if [ $? -eq 0 ];then
			echo "$user is created."
		fi
	fi
done





