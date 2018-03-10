#!/usr/bin/env bash
#1
var=bash
#echo "unix script" |awk 'sub()'
#echo "unix script" |awk 'lenth()'
echo "unix script" |awk "gsub(/unix/, \"$var\")"

#2
echo "unix script" |awk 'gsub(/unix/, "'"$var"'")'


#3(推荐)
unset var
echo "unix script" |awk -v var="bash" 'gsub(/unix/, var)'




#
i=5
df -h |awk '{ if(int($5)>'''$i'''){print $6 ":" $5} }'
