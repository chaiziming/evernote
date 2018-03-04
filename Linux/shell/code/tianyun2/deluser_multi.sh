#!/usr/bin/bash

for i in {1..10}
do
	userdel -r "ttt$i"
done
