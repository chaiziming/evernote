### rsyslogd
>系统日志采集进程，如系统操作有关的安全、认证、sshd、su

    rpm -qc rsyslog
    #和日志切割相关
    /etc/logrotate.d/syslog
    #rsyslogd主配置文件
    /etc/rsyslog.conf
    #rsyslogd相关配置文件
    /etc/sysconfig/rsyslog
    
    #syslog() man 3 syslog
    
local0-local7的日志/etc/rsyslog.conf记录在哪由用户自己定义  
远程发送日志需要配置rsyslog.conf的保存文件如@127.0.0.1，并且目标主机  
开启接受日志选项‘$UDPServerRun 514 //可以UDP or TCP 接受’

### logrotate
>日志轮转

    vim /etc/logrotat.conf
    
轮转前后可以执行其他命令

    /var/log/messages{
        prerotate
            chattr -a /var/log/messages
        endscript
    }
    
类似nginx的服务日志轮转后写入的文件还是以前的那个日志，所以就要在logrotate  
之后加入重载操作“HUP or reload”

### 常见日志

    #系统主日志
    tail /var/log/messages
    #认证与安全
    tail /var/log/secure
    #邮件postfix相关
    tail /var/log/mailog
    #crond at相关
    tail /var/log/cron
    #系统启动相关
    tail /var/log/dmesg
    #系统审计日志
    tail /var/log/audit/audit.log
    #yum
    tail /var/log/yum.log
    #ftp服务器
    tail /var/log/xferlog
    #w命令，当前登录的用户
    tail /var/log/wtmp
    #last命令，二进制文件最近登陆的用户
    tail /var/log/btmp
    #lastlog命令，二进制文件所有用户登陆情况
    tail /var/log/lastlog
    
    #第一列按数字倒序排序 sort -k1 -rn 
    #倒数第4列 awk 'print {$(NF-3)}'
    grep 'Fail' /var/log/secure | awk '{print $11}' | sort| uniq -c|sort -k1 -rn| head -5

### logger

    logger yyyyyyyyy
    #指定设备类型写入相应文件
    logger -p authpriv.info yyyyyyyyyy