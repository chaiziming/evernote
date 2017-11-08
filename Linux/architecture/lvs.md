1）安装ipvsadm

        $  yum  -y  install  ipvsadm

（2）设置ipv4转发

        $  sysctl  -w  net.ipv4.ip_forward=1

（3）关闭防火墙

        iptables  -F

（4）设置ipvsadm

        $  ipvsadm  -A  -t  192.168.0.211:80  -s  rr
        $  ipvsadm  -a  -t  192.168.0.211:80  -r  192.168.0.204  -m
        $  ipvsadm  -a  -t  192.168.0.211:80  -r  192.168.0.205  -m
        $  ipvsadm  -S

        $  ipvsadm  -L