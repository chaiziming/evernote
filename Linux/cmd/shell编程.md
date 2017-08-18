###shell简介
shell主要有两种语法类型，bourne和C,两种不兼容。bourne系列主要包括sh，ksh，bash，psh，zsh。  
C系列主要包括csh，tsh。linux默认使用bash

###shell执行方式  
shall是脚本解释型语言。  
“＃!/bin/bash”表示从此开始为shell脚本命令“#”这里并不是注释，其他行的“#”依然是注释  
tetris.sh是一个有意思的脚本
- echo

        -e 可以解释转义字符
   
   > 例如 echo -e \x61\t\x61  
   输出颜色 echo -e "\e[1;31m abcd \e[0m" #31m=黑色
   
           
- dos2unix 
> 将win dos换行转换“^M$”为linux的换行符“$” 

- unix2dos 
> 与dos2unix相反

###bash基本功能

1. 历史命令与补全
 
    history [选项][历史命令保存文件] 
           
         -c 清空历史命令
         -w 把缓存的历史命令写入历史命令的保存文件~/.bash_history
         
     


2. 命令别名与快捷键
3. 输入输出重定向
4. 多命令执行顺序与管道符
5. 通配符与特殊符号


