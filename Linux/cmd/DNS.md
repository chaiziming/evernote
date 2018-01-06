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
            listen-on port 53 { any; } //删除也行
            listen-on-v6 port 53 { any; } //删除也行
            allow-query { any; } //删除也行
            ...
            forwarders{ 114.114.114.114 }
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
    @.     IN      SOA     dns  root (2017081800 1H 15M 1W 1D)//简写
    @.     IN      NS     dns  root 
    @     IN     A     192.168.0.112
    dns     IN     A     192.178.0.111    
    www     IN     A     192.168.0.112
    ftp     IN     A     192.168.0.113