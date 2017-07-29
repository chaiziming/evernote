### 查看系统版本
lsb_release -a
### 查看网卡
cat /etc/sysconfig/network-scripts/ifcfg-eth0 
### 上传下载
up    scp -r root@192.168.6.253:/root/testDir/ /root/test/  
down   scp -r /root/test/ root@192.168.6.253:/root/testDir/
### ssh禁止超时
/etc/ssh/sshd_config 

“ClientAliveInterval指定了服务器端向客户端请求消息的时间间隔, 默认是0, 不发送.而ClientAliveInterval 60表示每分钟发送一次, 然后客户端响应, 这样就保持长连接了.这里比较怪的地方是:不是客户端主动发起保持连接的请求(如FTerm, CTerm等),而是需要服务器先主动。
另外,至于ClientAliveCountMax, 使用默认值3即可.ClientAliveCountMax表示服务器发出请求后客户端没有响应的次数达到一定值, 就自动断开。正常情况下, 客户端不会不响应。“
centos7 重启ssh： systemctl restart sshd

### 显式的修改一行
sed -i "s/AA/aaaaa/g" test.c

### 网络文件系统
将远程目录挂载到本机
sudo mount -t nfs -o tcp -o nolock IP:/dir /mnt  
配置文件 /etc/exports  
\*是ip sync是同步，表示其他人能看到目录的修改
/home/用户名/nfs \*(rw,sync,no_root_squash)  
然后创建目录/home/用户名/nfs
最后重启服务
/etc/init.d/nfs-kernel-server restart
exportfs -r
