#!/usr/bin/env bash
#wc -l
ss -ant | grep ':80' | awk -F ":" '/!LISTEN/{ips[$NF-1]++} END{ for(i in ips){print i,ips[i]} }' |sort -k2 -rn
#
awk '/22\/Mar\/2017/{ips[$1]++} END{for(i in ips){print i, ips[i]} }' ./log |sort -k2 -rn |head

#默认\t \s分割
awk '{print $1}' ./passwd
awk 'BEGIN{print 1/2} {print "ok"} END{print "------"}' ./passwd
awk 'BEGIN{FS=":"} {print $1,$2}' ./passwd
awk 'BEGIN{FS=":";OFS="---"} {print $1,$2}' ./passwd
awk '/root/' ./passwd
awk -F":" '/root/{print $1,$3}' ./passwd

#
df | grep '/' | awk '$4>500000{print $4}'
#
awk -F':' '{print NR,$0}' ./passwd ./a.txt
awk -F':' '{print FNR,$0}' ./passwd ./a.txt
awk -F':' '{print NR, $0, NF}' ./passwd ./a.txt
awk -F':' '{print NR, $0, NF, $NF}' ./passwd ./a.txt
#
awk -F'[ :\t]' '/root/{print $1,$3}' ./passwd
awk -F'BEGIN{RS=" "} {print $0}'  ./passwd
awk -F'BEGIN{ORS=" "} {print $0}'  ./passwd
awk -F'BEGIN{ORS=""} {print $0}'  ./passwd

#print 引号内是字符串，引号外是变量
data | awk '{print "Month:" $2 "\nYear:" $NF}'
#printf
awk -F':' '{printf "%-15s %-10s %-15s\n",$1,$2,$3}' ./passwd
#regexp
awk '/^alice/' ./passwd.sh
awk '$0 ~ /^alice/' ./passwd.
#------------------------------
awk '!/alice/' ./passwd
awk '$0 !~ /alice/' ./passwd
awk -F: '$1 ~ /alice/' .passwd
awk -F; '$NF !~ /bash/' ./passwd

#< <= > >= == !=
awk -F: '$3 == 0{print "ww"}' ./passwd
awk -F: '{ if($3>300){print $0}else{print $1} }' ./passwd
awk -F: '{ !($1 ~ /root/ && $3 <= 15) }' ./passwd
awk -F: '{ if($3*10>500){print $0} }' ./passwd
awk -F: '{ $3*10>500 }' ./passwd
#范围 打印从Tom行到Suzanne行
awk '/Tom/,/Suzanne/' filename
#指定多个分隔符
awk -F"[ :]+" '{print NF}' ./passwd
awk '$6 > .9' ./passwd
awk '{print ($7 > 4 ? "high "$7 : "low "$7)}' ./passwd
awk '$3 == "Chris" {$3 = "Christian"; print $0}' ./passwd
awk '/Derek/ {$8+=12; print $8}' ./passwd
#
awk -F: '{ if($3==0){i++}else if{$3>999}{k++} else{j++} } END{print i,j,k}' ./passwd
awk -F: 'BEGIN{ i=1; while(i<=10){print i; i++} }'
awk -F: '/^root/ {i=1; while(i<=NF){print $i; i++}}' ./passwd
awk -F: 'BEGIN{ for(i=1;i<=5;i++){print i} }'
awk -F: 'for(i=1;i<=NF;i++){print $i}' ./passwd
#array
awk -F: '{username[i++]=$1} END{print username[1]}' ./passwd
awk -F: '{username[x++]=$1} END{ for(i=1;i<=x;i++){print i,username[i]} ./passwd }'
#注意：变量i是数组索引与shell里相反
awk -F: '{username[x++]=$1} END{ for(i in useranme){print i,username[i]} ./passwd }'
ss -ant |grep ':80' |awk '{status[$NF]++} END{ for(i in status){print i,status[i]} }'