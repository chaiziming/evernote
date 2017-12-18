### PE 物理扩展
4 8 16 32M 

### LE 逻辑扩展

### pvcreate

### vgcreate

### lvcreate 

    lvcreate -L 50M -n lv1 vg1
    vg的50%空间 lvcreate -l 50%VG -n lv2 vg1
    全部剩余空间 lvcreate -l 100%FREE -n lv3 vg1

     多少空间    -L
     多少逻辑卷  -l
     名称        -n
     
     快照 -s
     快照卷和原始卷在同一vg
     
     lvcreate -L 50M -n lv1-snap /dev/datavg/lv1
    mount -o ro /dev/datavg/lv1-snap /mnt/lv2-snap
    如果是xsf文件系统不能这么挂要这样
    moount -o nouuid,ro /dev/datavg/lv1-snap /mnt/lv2-snap
    

mysql备份方案，先创建读锁，再建立lv快照，然后解锁，mount -o ro 挂快照
从快照卷中复制数据，备份完成后卸载快照卷，最后lvremove -f snapshot


从哪个VG创建 



    
### lvsan lvs

### gvsan gvs

### vgsan vgs

### vgdisplay

### ==>
       创建pv
       创建vg
       创建lv
       格式化lv

### vgextent
    
    vgextent 哪个vg 从哪个设备
    
### vgreduce

    vgreduce /dev/vda

### pvmove
> 移动物理扩展
    
    pvmove /dev/vda
    

### 扩充vg

    一般把普通盘，变成pv
    然后再用vgextend 扩容原有的vg 
    也可以直接vgextend扩容这样会自动转pv

### 减小vg

### lvextent

    扩展数 -L +200m /dev/datevg/lv2

### fs扩容
    
    ext系统不加参数默认加到头 resize2fs   /dev/datevg/lv1
    xfs系统不加参数默认加到头 xfs_growfs /dev/datevg/lv2


### 逻辑卷快照 
   
### snap ==>

### swap分区
### mkswap 
   
1. 准备分区 fdisk gdisk lvm 文件
    
     fdisk /dev/vdb (t 转换分区id 为82) 
     partprobe /dev/vbd 
      
2. 初始化

     mkswap /dev/vbd1 
     
3. 挂载

     blkid /dev/vbd1 
     vim /etc/fstab
     swapon -a (读取/etc/fstab)
     swapon -s
     
     








