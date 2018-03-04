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