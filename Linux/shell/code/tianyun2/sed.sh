#!/usr/bin/env bash
sed -r '/sees/{n;d}' ./passed
sed -r '$d' ./passwd
sed -r '$a\chroot' ./passwd
#
sed -r '2{s/WE/1000Phone/g; s/Gray/YYY/g}' ./passwd
sed -r -e '1,3d' -e 's/hemp/jong/' ./passwd
sed -r 'G;G' ./passwd
sed -r '1{h;d}' ./passwd
sed -r '1h;2,3H;$G' ./passwd
sed -r '4h;5x;6G' ./passwd
sed -r '1,3{h;d};$G' ./passwd

#
sed -r '/^[ \t]*($|#)/d' ./passwd
sed -r '2,5c\No number'
#
sed -ri '^SELINUX=/c\SELINUX=disabled' /etc/selinux/config
#
var1=111
sed -r "2a$var1" ./passwd
sed -r '$a'"$var1" ./passwd
sed -r "\$a$var1" ./passwd
#
sed -r '1!G;$!h;$!d' ./passwd






