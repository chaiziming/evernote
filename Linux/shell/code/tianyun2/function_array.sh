#!/usr/bin/env bash
num=(1 2 3 4 5)
#echo ${num[@]}

fun_array(){
	local factorial=1
	for i
	#for i in $@
	#for i in ${num[*]}
	do
		factorial=$[$factorial * $i]
	done
	echo $factorial
}

#fun_array ${num[@]}
res=`fun_array ${num[*]}`
echo $res
