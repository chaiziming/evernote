#!/usr/bin/bash
#cp this script dir to ~/.bash_profile or .bash_rc  

trap "" HUP INT OUIT TSTP

web1=192.168.1.222
web2=192.168.1.225
mysql1=192.168.1.21
clear

while :
do

	cat <<-EOF
	1. web1
	2. web2
	3. myslq1
	EOF

echo -ne "\e[1;32minput number: \e[0m"
read  num
case "$num" in
1)
	ssh alice@$web1
	;;
2)
	ssh alice@$web2
	;;
3)
	ssh alice@$myslq1
	;;
"")
	;;
*)
	echo "error"
esac
done
