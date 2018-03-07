#!/usr/bin/env bash
#“:”返回一个0的执行结果
for i
do
    let num+=$i
done
echo "sum:$sum"

#while shift 位置参数向左移
while [ $# -ne 0 ]
do
    let num+=$1
    shift
done

while [ $# -ne 0 ]
do
    useradd $1
    echo "$1 is create"
done