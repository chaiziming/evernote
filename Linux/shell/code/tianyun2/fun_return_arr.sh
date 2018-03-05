#!/usr/bin/bash
num=(1 2 3)
fun_arr(){
	#echo "all paramters: $*"	
#	local newarr=(`echo $*`)
	local newarr=($*)
	for((i=0;i<$#;i++))
	do
		#outarr[$i]=$[${newarr[$i]} * 5 ]
		newarr[$i]=$(( ${newarr[$i]} * 5 ))
	done
	echo ${newarr[*]}
}

res=`fun_arr ${num[*]}`
echo ${res[*]}

fun_arr2(){
	for i in $*
	do
		newarry[$i]=$[i * 5]
	done
	echo ${newarr[*]}
}
res=`fun_arr2`
echo ${res[*]}








