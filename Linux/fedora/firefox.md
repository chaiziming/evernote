### [没有声音](https://www.cnblogs.com/longwaytogo/p/5610002.html)

    #执行下列命令，然后重启Firefox ，就解决问题了。
    su -c 'dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
    dnf -y install vlc
    