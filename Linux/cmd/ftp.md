###
    21 20(主动模式)
    
### selinux 关闭

    sed -i '/^SELINUX=/cSELINUX=disabled/' /etc/selinux/config
    setenforce 0
### 