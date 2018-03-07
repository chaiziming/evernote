#!/usr/bin/env bash
#反
grep -v '^#' /etc/vsftpd/vsftpd.conf
grep '^[^#]' /etc/vsftpd/vsftpd.conf
#search
grep --help | grep '\-v'
#grep -i ignore case 
#grep -r recursive
#grep -n
#grep -o
grep -A
grep -B
grep -C

egrep '([0-9]{1,3}\.){3}[0-9]{1,3}' /ect/sysconfig/network-scripts/ifcfg-en5
