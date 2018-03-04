#!/usr/bin/bash

name=www.baidu.com
echo ${name:2}
echo ${name:2:5}
echo ${#name}
echo ${name/baidu/sina}
echo ${name#baidu}
echo ${name#*.}
echo ${name##*.}
echo ${name%.*}
echo ${name%%.*}



info=(aaa bbb ccc [20]=ggg)
declare -A info1=([name]=aaa [age]=35)
info2=(`ls ./`)
info3[0]=a
info3[1]=b
info3[2]=c

echo ${info[1]}
echo ${info1[name]}
echo ${info[@]}
echo ${!info[@]}
echo ${info[@]:0:2}
echo ${info[@]:2}








