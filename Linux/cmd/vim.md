### 光标定位

    hjkl
    0 $
    gg G
    3G
    /string
    /^$ 正则
    
### 文本编辑

    y
    d 
    p
    x 删除光标所在字符 
    D 删除光标所在字符到行尾
    u 
    ^r redo 重做 ctrl+r
    r 修改一个字符
    
### 进入其他模式

    a
    i
    o
    A
    I
    O
    
### 光标移动    
    
    w b h l j k
    M #光标移动到这一屏的中间行
    L #光标移动到这一屏的最后行行首
    G #光标移动到文件最后行行首
    num + G #移动到第num行行首
    
### 翻屏

    ctl + d/u/ 下上翻半屏
    ctl + f/b 下上翻一屏
    
### 格式化

    gg=G 
    
### 删除

    x X #删除光标后前
    [num +] dd #删除从当前行开始的num行
    d + 0 #删除光标前所有内容
    d + $ #删除光标后所有内容
    d + w #删除一个字
    
### 撤销与反撤销

    u #撤销
    ctl + r #反撤销
    
### 文本移动

    >> << #左右移动
    
### 分屏

    #命令模式
    #纵分
    :sp [+ filename]
    #横分
    :vsp [+ filename]
    #分屏之间切换
    ctl + ww
    #关闭分屏
    :q
    
    #vim 命令分屏
    # n是 1 2 3 ....
    vim -on file1 file2
    vim -On file1 file2
    
    #快捷键方式分屏
    ctl + w + s
    ctl + w + v
    #快捷键方式关闭分屏
    ctl + w + c #关闭当前窗口
     
    #分屏尺寸
    ctl + w + "[num]+" 放大
    ctl + w + "[num]-" 缩小
    
    ctl + w + "[num]>" 分割线左移
    ctl + w + "[num]<" 分割线右移
    
### 查看函数说明

    #光标放在函数上
    [man num] + K
    #查看宏定义
    [-d


### 扩展模式（末行模式...）

    v
    ^v
    V
    R
    
### ^s锁屏 ^q解屏


### 替换

    :1,3 s/net/root  1到3行 net 替换 root
    :1,$ s/net/root  1到最后行 net 替换 root
    :% s/net/root    全文 net 替换 root
    
    :1,3 s#net#root  1到3行 net 替换 root
    :1,3 s@net@root  1到3行 net 替换 root
    
    :1,3 s/.*/#&  1到3行 整行 替换 前面加“#”
    :1,3 s/.*/&#  1到3行 整行 替换 后面加“#”
    
### 另存为

    :w /root/a.txt
    
### 读入

    :r /root/a.txt 读到当前光标
    :4 r /root/a.txt 读到当前第四行
    
### 设置环境

    :set nu
    :set ic   忽略大小写 ignore case
    :set ai   自动缩进  auto 
    :set list  显示控制键
    :set nolist  不显示控制键
    
### 配置文件

    /etc/vimrc  所有用户
    ~/.vimrc    某一个用户

### 编辑多文件

    vim -O|o a.txt b.txt
    
### 找不同

    vimdiff -O a.txt b.txt

### sed

    #s查找替换，g全部
    sed 's/tom/alice/g' a.txt
    #c整行替换
    sed -i '/^SELINUX=/cSELINUX=disabled/' /etc/selinux/config