#!/usr/bin/bash
srceen -S srceenname
srceen -list 
srceen -r 5269

jobs 
bg %1 
fg %1
#kill bg
kill %3

ip addr | grep 'inet' | tee test | grep eth0 
ip addr | grep 'inet' | tee -a test | grep eth0 

cat < /etc/hosts
echo 'www' > test.txt
#cp
cat < /ect/hosts > /etc/host1

/usr/bin/cat <<-EOF
111
EOF

/usr/bin/bash <<-EOF
echo 111
EOF


cat <<-EOF > file1
111
222
333
EOF








