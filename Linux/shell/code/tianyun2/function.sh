#!/usr/bin/env bash
factorial(){
factorial=1
for ((i=1; i<=$1; i++))
do
    factorial=$[$factorial * $i]
done
echo  "$1 的阶乘是：$factorial"
}


factorial $1

#函数返回值默认是函数最后命令的"$?"码
#return 能够修改返回码，一般用函数输出out
fun2(){
	read num
	let 2*$num
}

fun3(){
	read num
	return let 2*$unm
}

fun2
fun3

fun4(){
	read -p "input num" num
	echo $[2 * $num]
}

res=`fun4`












