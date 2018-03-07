### awk
> awk是编程语言，数据可以来自标准输入、一个文件、多个文件或其他命令输出。awk支持自定义函数，
> awk处理文本数据方式是：从首行到末行，逐行扫描文件，查找与模式匹配的行，并在这些行上进行用户
> 指定的操作。如果没有指定动作，则把匹配的行标准输出（显示到屏幕）。如果没有指定模式，则所有被
> 操作指定的行都被处理。

    awk [option] '[pattren] commands' filenames
    awk [option]  -f awk-script-file filenames （不推荐）
    
### 命令格式
> awk默认字段分隔符是 \s \t
> awk默认行分隔符是 \n
> FS OFS NR FNR NF RS ORS
    
    #RS 行输入分隔符
    #ORS 行输出分隔符
    #FS 字段输入分隔符
    #OFS 字段输出分隔符
    #NR 行号,总文件的行号
    #FNR 行号，当前文件的行号
    #NF 被分割的字段数
    #$NF 获取最后一列字段 $FNR
    
    #RS 记录（行）分隔符
    #ORS 记录（行）分隔符
    #pattren
    awk /^root/ ./passwd
    df | grep '/' | awk '$4>500000{print $4}'
    
    #command模版
    awk 'BEGIN{print 1/2}{print "ok"}END{print"-------"}' /etc/hosts
        |        1             2               3        |
        |                  commands                     |
        |       行处理前      行处理         行处理后       |
        
    #自定义分割符
    -F ":" #指定“：”分割
     
    #整行是$0
    
    