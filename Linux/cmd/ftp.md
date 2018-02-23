###
    21 20(主动模式)
    
### selinux 关闭

    sed -i '/^SELINUX=/cSELINUX=disabled/' /etc/selinux/config
    setenforce 0
### 主动被动模式

    主动是服务器用21端口连接客户端
    被动是服务器提供一个随机端口让客户端连接    