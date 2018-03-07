### awk
> awk是编程语言，数据可以来自标准输入、一个文件、多个文件或其他命令输出。awk支持自定义函数，
> awk处理文本数据方式是：逐行扫描文件，从首行到末行，查找与模式匹配的行，并在这些行上进行用户
> 指定的操作，如果没有指定动作，则把匹配的行标准输出（显示到屏幕），如果没有指定模式，则所有被
> 操作指定的行都被处理。

    awk [option] 'commands' filenames
    awk [option]  -f awk-script-file filenames