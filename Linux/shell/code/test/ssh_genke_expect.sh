#!/usr/bin/bash

>ip.txt

password=root

rpm -q expect &> /dev/null

if [ $? -ne 0 ]; then
	yum -y install expect
fi

if [ ! -f ~/ssh/id_rsa ]; then
	ssh_kengen -P "" -f ~/.ssh/id_rsa
fi 


for i in {2..12}
do
	ip=127.0.0.$i
	ping -c1 -W1 $ip &> /dev/null
	if [ $? -eq 0 ]; then
		echo $ip >> ip.txt
		/usr/bin/expect <<-EOF
			spawn ssh_copy_id $ip
			expect {
				"yes/no" { send "yes\r" }
				"password:" { send "root\r" }
			}
			expect eof
		EOF
	fi
done
wait
