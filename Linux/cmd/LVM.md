### PE 物理扩展
4 8 16 32M 

### LE 逻辑扩展

### pvcreate

### vgcreate

### lvcreate 

     多少空间    -L
     多少逻辑卷  -l
     名称        -n

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

    
   
    








