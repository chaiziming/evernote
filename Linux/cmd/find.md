### locate

### updatedb

### find

    which 利用PATH查找的
    修改时间5天以内 find /etc -mtime -5 
    find /etc -size +5M -ls
    find / -maxdepth 3 -a -name "ifcfg-eth0"
    find /home -user jack -o -group hr
    find /home -nouser -o -nogroup -ls
    find /dev -type f
    find /dev -type d
    find . -perm 644 -ls
    包含这个权限 find . -perm -400 -ls
    find /etc -regex '.*ifcfg-eth[0-9]+'
    -a 并且
    -o 或
    
    action
    -ls
    -delete
    执行命令{}表示将查找的内容作为后面命令的执行参数 -exec {}\;
    交互的执行命令 -ok {}\;
    find /etc -iname "ifcfg*" exec rm -rf {}\;
    find /etc -iname "ifcfg*" |xargs rm -rf  /var/tmp 
    find /etc -iname "ifcfg*" |xargs -I {} cp -rf {} /var/tmp
    "-I {}" 定义一个{}
    ll -rt /etc | head



### 删除文件

    find /boot/dir1 -name  "file*" -delete