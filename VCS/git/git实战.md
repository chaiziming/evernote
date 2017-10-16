1. [通过Tag标签回退版本修复bug](http://blog.csdn.net/fuchaosz/article/details/51698896)

    总结  
    通过标签修改bug的步骤如下：  
    主分支回退到打标签的那次提交。
    拉取分支bugfix。
    主分支立即回到最新状态。
    切换到bugfix分支，修改bug，发版本，打新标签。
    合并bugfix分支到主干上。
    手动推送标签到远程。
    
2. [远程仓库版本回退方法](http://blog.csdn.net/fuchaosz/article/details/52170105)

    总结  
    自己的分支回滚直接用reset  
    公共分支回滚用revert  
    错的太远了直接将代码全部删掉，用正确代码替代  
    
    
3. dos2unix和unix2dos

    dos2unix和unix2dos这两个命令用来转换CRLF。  
    [plain] view plain copy  
    dos2unix -kn file newfile    
    -k 保持源文件mtime  
    -n 保留旧文件，转换结果输出到新文件  
    
4. 之前登录过，再登录出现“WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!”

    ssh-keygen -R 47.93.247.136