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
