###常用配置项

    ServerRoot "/etc/httpd"     //安装目录
    Liseten 80
    IncludeOptional conf.d/*.conf //加载额外的*.conf文件
    User apache                 //运行用户
    Group apache
    DirectoryIndex index.html
    DocoumentRoot               //站点默认主目录
    
    <Directory "/var/www">      //目录访问控制
        AllowOverride None      
        #Allow open access:
        Require all granted     //all ip
    </Dircetory>
    
    #vim /etc/httpd/conf.d/*.conf
    <VirtualHost *:80>
        ServerName www.aaa.com
        ServerAlias aaa.com
        DocoumentRoot /webroot/aaa
        ...
    </VirtualHost>
    <Directory "/webroot/aaa">      //目录访问控制
        Require all granted     //all ip
    </Dircetory>
    
### 2.2配置项

    #进程模式
    <IfModule prefork.c>
        StartServers            //最初建立进程数
        MinSpareServers         //最小空闲进程
        MaxSpareServers         //最大空闲进程
        ServerLimit             //最大启动进程数，默认256
        MaxClients              //最大并发连接数，默认256
        MaxRequestsPerChild     //每个子进程在生命期内的最大响应请求数，0不限制
    </IfModule>
    
    #线程模式
    <IfModule worker.c>
        StartServers            //最初建立进程数
        MinSpareThreads         //最小空闲线程数
        MaxSpareThreads         //最大空闲线程数
        ThreadsPerChild         //每个进程建立线程数
        MaxClients              //最大并发访问量，默认256
        MaxRequestsPerChild     //每个子进程在生命期内的最大响应请求数，0不限制
    </IfModule>
    
### httpd

    #检测配置语法
    httpd -t 
    
 ### ssl https
 > https 覆盖要全部网站链接才是安全的 
 
    #要开启模块mod_ssl
    yum -y install mod_ssl
    #这里也能配
    vim /etc/httpd/conf.d/ssl.conf
    #一般在配vhost
    
    #$1 代表 a.html 不包含域名
    #R=301 L 永久重定向301 last
    <VirtualHost *:80>
        ServerName www.aaa.com
        ServerAlias aaa.com
        RewriteEngine On
        RewriteRule ^(.*)$ https://www.abc.com$1 [R=301 L]
    </VirtualHost>
    
    <VirtualHost *:443>
        ServerName www.aaa.com
        #ServerAlias aaa.com //这里没用了
        DocoumentRoot /webroot/aaa
        ...
        SSLEngine on
        SSLCertificateFile /etc/httpd/21028763237320.pem  //证书
        SSLCertificateKeyFile /etc/httpd/21028763237320.key //私钥
    </VirtualHost>
    