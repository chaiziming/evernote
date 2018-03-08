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


