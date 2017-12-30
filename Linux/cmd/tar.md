### 
    
    #解压所有类型
    tar -xf  tar.xz
    #指定解压路径
    tar -xf tar.xz -C /var/myslq
    #打包（注意路径是去掉“/”的，解压时要带着“/”）
    tar -zcf /tmp/mysql.tar.zg /var/myslq 
    #打包移动海量小文件“-”代表只记到内存上，但这时解压必须带上“z”（类型）
    tar -czf - /etc | tar -xzf - -C /tmp
    #夸主机传输小文件
    systemctl stop firewalld.service //
    nc -l 8888 | tar -xzf - -C/tmp     //A监听一个端口来解压
    tar -czf - /etc | nc 192.168.0.111 8888 //B向目标传打包文件