#!/usr/bin/env bash
#一部分按正则
grep  ''
#严格按正则
egrep  'c+'
#vim 正则替换
# :1,$ <=> %
# :1,$ s/tom/David/g
# :1,$ s/\<[Tt]om\>/David/g

# ^ $ . * [] [ - ] \ \< \> \( \) 
# x\{num \}

grep "^\<root\>" /etc/passwd
egrep "^\<root\>" /etc/passwd
#:%s/\(10.18.40\).100/\1.200/
#:%s#\(10.18.40\).100#\1.200#

# + ? | () 
#静默
grep -q 'root' /etc/passwd; echo $?
#:%s/\(10.18.40\).100/\1.200/
