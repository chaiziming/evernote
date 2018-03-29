### fedora 27 安装 vmware 14

下载地址：http://www.vmware.com/cn/products/workstation/workstation-evaluation.html

安装说明：http://www.tecmint.com/install-vmware-workstation-in-linux/

安装序列号：  

VY74R-2GG80-4848P-UWW7X-Q22Y8  
YC150-4QYDJ-M88NZ-AWQ59-QYKW0


    #给vmware安装包执行权限，然后安装vmware
    #使用root用户或者有sudo权限的用户安装
    chmod +x VMware-Workstation-Full-12.5.0-4352439.x86_64.bundle
    
    ./VMware-Workstation-Full-12.5.0-4352439.x86_64.bundle
    
    dnf groupinstall "Development tools" 
    
    rpm -qa |grep kernel-headers
    
    rpm -qa |grep kernel-devel
    
    #注意kernel-headers 和 kernel-devel 的版本与vmware要求的要相同
    dnf install kernel-headers kernel-devel
    
    
### 环境变量display
> vmware 需要图形化界面 

    xhost +
    export DISPLAY=:0
    xhost +

### 开启虚拟化
> AMD-V SMV
    


### EFI VMware Virtual SCSI Hard Drive ... unsuccessful
> 去掉虚拟系统目录中VMX文件里面的firmware="efi"

    #例如
    vim /home/czm/vmware/win10/win10.vmx
    
### vmware 14 激活密钥
CG54H-D8D0H-H8DHY-C6X7X-N2KG6