### RAID 
    
### RAID0
> 条带集  (最快)

### RAID1
> 就是镜像 (不快)

### RAID5
> (快)

### (软RAID)mdadm

    mdadm -C /dev/md0 -l5 -n3 -x1 /dev/sd{d,e,f,g}
    
    RAID设备名 /dev/md0
    创建RAID -C
    RAID LEVEL -l
    RAID成员数 -n
    热备磁盘数 -x
    