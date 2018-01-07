### 唯一缓存dns服务器 
    
    #安装DNS服务
    yum -y install bind bind-chroot
    #配置文件
    vim /etc/named.conf
    opetions{
        listen-on port 53 { any; }; //删除也行
        listen-on-v6 port 53 { any; }; //删除也行
        allow-query { any; }; //删除也行
    }
    systemctl restart named
    firewall-cmd --permanent --add-serviec dns
    firewall-cmd --reload
    ss -tunl  |grep :53 | column -t
    #检测dns
    yum -y install bind-util
    dig www.baidu.com
    #flag ra不权威 aa是权威
    #dns转发
    opetions{
            listen-on port 53 { any; }; //删除也行
            listen-on-v6 port 53 { any; }; //删除也行
            allow-query { any; } //删除也行
            ...
            forwarders first;优先转发
            forwarders{ 114.114.114.114 };转发到这里
    }
    
    #域名解析
    zone "tianyun.com" {
        type master;
        file "tianyun.com.zone"
    };
    vim /var/named/tianyun.me.zone
    #tianyun.me internet 授权给dns.tianyun.me 有问题发邮箱到root.tianyun.me
    #每隔一小时辅助dns服务器和主dns服务器同步一次
    #如果没有同步成功15分钟重试
    #最多重试一周就放弃了
    #缓存1天
    #SOA起始授权记录（强制），NS：DNS服务器记录（强制），A：主机记录，CNAME：别名记录
    tianyun.me.     IN      SOA     dns.tianyun.me. root.tianyun.me. (2017081800 1H 15M 1W 1D)
    #例如
    @.     IN      SOA     dns  root (2017081800 1H 15M 1W 1D)//简写
    @.     IN      NS     dns   
    @.     IN      A     192.168.0.113   
    dns     IN     A     192.178.0.112    
    www     IN     A     192.168.0.113
    ftp     IN     A     192.168.0.114
    
### dig

    #指定哪个dns服务器解析哪个域名
    dig @10.10.11.111 www.baidu.com
    #使用配置文件的dns服务器解析
    dig  www.baidu.com
    
### host

    #查询域的授权记录
    host -t SOA tianyun.me
    #查询主机记录
    host -A www.tianyun.me
    host www.tianyun.me //简写形式
    #查询NS记录
    host -NS tianyun.me
    #查询域的邮件服务器
    host -MX tianyun.me