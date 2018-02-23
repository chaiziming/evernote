###包过滤防火墙

###四张表，五条链
>raw ---> mangle --> nat --> filter

    raw表：连接追踪
    mangle表：对数据包做标记和修改
    nat表：修改数据包的地址和端口
    filter表：数据包的过滤
    
    prerouting链：包进入路由表的第一条链（raw表，mangle表，nat表）（目标地址转换）
    input链：包进入本机时经过的链（mangle表，filter表）
    forward链：包从本机转发时经过的链（mangle表，filter表）
    postrouting链：包离开路由表时经过的链（mangle表，源地址转换）
    output链：包离开本机时经过的链（mangle表，filter表）
                        
### iptables语法

    iptables [-t 要操作的表] <操作命令> [要操作的链] [规则号码] [匹配条件] [-j 匹配后的动作] 
                    小写        大写        大写                    小写        大写
    
    #默认就是filter表
    iptables -L 
    iptables -nL 
    iptables -vnL 
    iptables -F
    iptables -t filter -L                
    iptables -I INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --syn -dport 80 -j ACCEPT
    iptables -I INPUT -p icmp -j ACCEPT
    iptables -I INPUT 2 -p tcp --dport 20:21 -j ACCEPT
    iptables -D INPUT 1
    iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -i lo -j ACCPET
    iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
    iptables -A INPUT -j REJECT
    iptables -P INPUT DROP

    #常用命令
    -L  #查看，v详情，n不反解 （不要将80/tcp解释成什么http、不要将ip解释成域名），--line-number
    -A  #追加，放置最后一条
    -I  #插入，默认插入成第一条
    -D  #删除
    -F  #清空flush
    -P  #设置默认策略policy
    
    #匹配条件
    -s 192.168.1.0/24 #来自与这个网段的
    -d 192.168.1.0/24 #到这个地址的
    -i lo   # input 从lo接口进入的数据包
    -o eth0 # output 从eth0 出去的数据包
    -p tcp --dport 80 目标端口是80/tcp（必须和-p 协议连用）
    -p udp --dport 53 目标端口是53/udp                 
    
    #处理动作
    filter:
    -j ACCEPT  #允许
    -j DROP    #丢弃
    -j REJECT  #拒绝
    -j LOG     #写日志
    
    nat:
    -j SNAT #源地址转换      POSTROUTING
    -j DNAT #目标地址转换    PREROUTING 
    
    mangle
    -j MARK #修改数据包（如：打标记）
    
### 实际问题
> input链不能单纯限制接口，因为服务器访问外部连接时，用的是随机端口，外部对本机的访问
会被屏蔽，使本机无法访问其他主机。另外本地回环网也没有必要屏蔽

    解决1：
    #放开对本地回环的限制
    iptables -I INPUT -i lo -j ACCEPT
    #通过对established,related状态判断是本机访问其他主机
    iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCPET
    #ftp被动模式
    iptables -I INPUT -p tcp --dport 20:21 -j ACCEPT
    vim /etc/vsftpd/vsftpd.conf
    #指定ftp服务器开放端口范围（不推荐）
    pasv_min_port=500000
    pasv_max_port=600000
    iptables -I INPUT -p tcp --dport 50000:60000 -j ACCEPT
    #使用连接追踪模块,将new状态变成related
    modprobe nf_conntrack_ftp
    modinfo nf_conntrack_ftp
    #永久记录连接追踪模块
    vim /etc/sysconfig/iptables-config
    IPTABLES_MODULES="nf_conntrack_ftp"
    #centos6 用如下命令保存配置，生成记录在/etc/sysconfig/iptables文件
    service iptables save
    
### 扩展匹配
 > man iptables /MATCH EXTENSIONS
 
    #查看帮助
    iptables -m icmp -h 
    iptables -m iprange -h 
    iotables -m state -h
    #
    
    
### -m
    
    #我能ping别人，别人不能ping我
    iptables -F
    iptables -A INPUT -j REJECT
    iptables -A INPUT -i lo -j ACCEPT
    iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    
    #我能ping别人，别人不能ping我（不推荐）
    iptables -I INPUT -p icmp -m icmp --icmp-type echo-reply -j ACCEPT
    #ip范围
    iptables -I INPUT -m iprange --src-range 192.168.0.20-192.168.0.100 -j ACCEPT
    #多个端口
    iptables -I INPUT -p tcp -m multiport --dport 20,22,110,80 -j ACCEPT
    #取反
    iptables -I INPUT ! -m state --state ESTABLISHED,RELATED -j ACCEPT
    #limit 每分钟只能有三个握手连接 
    iptables -A INPUT -p tcp --syn --dport 22  -m limit --limit 3/minute -j ACCEPT
    #connlimit 限制最大连接数为2
    iptables -I INPUT 3 -p tcp --syn --dport 22 -m connlimit --connlimit-above 2 -j ACCEPT
    #按时间段限制
    iptables -R INPUT 3 -p tcp --syn --dport 22 -m time --timestart 9:00 --timestop 19:00 -j ACCEPT
    #-m mark通过标记限制只有标记了2的才可以
    iptables -I INPUT 4 -m mark --mark 2 -j ACCEPT
    #在入口处加个2标记
    iptables -t mangle -A PREROUTING -p tcp --syn --dport 80 -j MARK --set-mark 2
    #加注释
    iptables -A INPUT -s 172.16.10.11 -m comment --comment "xxxx" -j REJECT
    
    # -m tos # ip头 type of service
    #只让scp不能ssh
    iptables -F
    tcpdump -i eth0 -nn  -vvv host 192.168.0.112 and port 22
    
    #iptables -I INPUT 2 -p tcp --dport 22 -m tos ! --tos 0x10 -j ACCEPT（错误）
    iptables -I INPUT -p tcp --dport 22 -m tos --tos 0x10 -j REJECT
    
    #-m tcp --syn 是它的简写
    
    #
    
### 扩展动作
> 当路由器，当网关

    filter:
        -j ACCEPT
        -j DROP
        -j REJECT
        -j LOG
    nat:
        -j SANT             #转换源地址
        -j MASQUERADE       #转换源地址（伪装）
        -j DNAT             #转换目标地址和端口
        -j REDIRECT         #转换目标端口（本机重定向）
    mangle:
        -j MARK
    
### 记录日志
> -j LOG
        
        #首先要开启rsyslog功能
        #grep 'kern.*' /etc/rsyslog.conf
        #kern.*     /var/log/kernel.log
        #service rsyslog restart
        #centos6 不能同时记日志和允许规则
        
        iptables -j LOG -h
        iptables -F
        iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A INPUT -i lo -j ACCEPT 
        iptables -A INPUT -p tcp --syn --dport 22 -j LOG --log-prefix "ssh_conn "   
    
### -j REJECT
> 当访问一个未开启的TCP端口时，应该返回一个带有RET（reset）标记的包
当访问一个未开启的UDP端口，结果返回port xxx unreachable
当访问一个开启的TCP端口，但被防火墙REJECT，结果返回port xxx unreachable    
    
    iptables -j REJECT -h 
    #反回不是默认的消息，不同的协议，只能对应不同的消息
    iptables -A INPUT -p tcp --dport 22 -j REJECT --reject-with tcp-reset
    
    
### -j MARK
> 
    
    iptables -F
    iptables -t mangle -F
    iptabels -A INPUT -m state --state  ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -i lo -j ACCEPT
    iptables -t mangle -A PREROUTING -p tcp --syn --dport 22 -j MARK --set-mark 22
    iptables -A INPUT -m mark --mark 22 -j ACCEPT
    iptables -A INPUT -j REJECT
    iptables -t mangle -nL PREROUTING
    
### NAT表
> POSTROUTING: SANT,MASQUERADE
必须开启 kernel ip_forward
    
    #内部请求外网，外网返回来的全转到166上去SNAT是写死的，MASQUERADE是动态的
    iptables -t nat -A POSTROUTING -j SNAT --to 192.168.122.166
    iptables -t nat -A POSTROUTING -j MASQUERADE

> DNAT （端口映射）   
必须开启 kernel ip_forward
    
    #外网主动请求内网    
    iptables -t nat -A PREROUTING -d 172.16.30.30 -p tcp --dport 80 -j DNAT --to 192.168.0.111:8080
    iptebles -t nat -A PREROUTING -p tcp --dport 2222 -j DNAT --to 192.168.0.111:22
    
    #本地端口转发
    iptables -t nat -A PREROUTING -p tcp --dport 8000 -j REDIRECT --to 80