git bash  
右键 option 选项 looks 设置 cursor 光标 block  
右键 option 选项 text 设置 font 字体 12pt local 是zh-CN utf-8  

配置  
git config --list  
git config --global user.name "xxx"  
git config --global user.email "xxx"  
git config receive.denyCurrentBranch ignore 允许接收提交  
git config --global core.safecrlf false 不保存crlf  
git config --global alias.别名 命令 //设置别名  
git config --global credential.helper wincred 存储凭证(常用 https)  


仓库  
git init                                                #新建一个git库  
git init --bare                                         #
git clone [url] [dir]                                    #检出一个库  

添加删除文件
git add [file1]  [file2]                            #添加文件到暂存区，“.”代表提交全部  
git rm [file1]   [file2]                            #删除工作区文件，并将这次删除，记录到暂存区  
git rm --cached file_path                             #删除版本控制里的文件，不删除本地文件
git mv [file-origin]   [file-renamed]      #修改文件名，并将这次修改，记录到暂存区  
git clean -n                                #列出没有被跟踪的文件
git clean -f                                 #删除没有被跟踪的文件

提交代码  
git commit -m [message]                     #提交暂存区到仓库  
git commit -a -m [message]                #直接从工作区提交到仓库，前天是该文件已经有仓库的历史版本  

查看信息  
git status                                             #显示便更信息  
git status -sb                                      #简单显示
git log                                                  #显示当前分支的历史版本  
git log --oneline (--pertty=oneline)      #简化清晰的看历史版本  
git reflog  
git show [hash]                                     #查看指定的提交内容，hash是git给出的commit标识  
git blame [filename]                                  #查看文件提交信息

标签
git tag                         #查看标签列表
git tag -d \[tagname]           #删除标签
git tag \[tag name]             #当前版本加入标签
git tag \[tag name] \[hash]     #在指定版本加入标签
git push  --tag                 #把所有标签推上去
git push \[origin] :refs/tags/\[tag name] #删除远程标签

签则是仓库中的一个独立对象。建议使用附注标签。  

git tag v0.1.2-light              # 创建轻量标签  
git tag -a v0.1.2 -m “0.1.2版本” # 创建附注标签  

git reflog #查看所有提交版本（常用在版本回退回去再回来的这种场景）


同步远程仓库  
git remote -v                                        #查看与远程仓库的链接的别名  
git remote add [shortname] [url]           #增加远程仓库，并命名  
git remote remove [shortname]            #删除指定别名  
git push [remote] [branch]                    #将本地的提交推送到远程仓库  
git push --set-upstream [alise]         #set main push
git pull [remote] [branch]                      #将远程仓库的提交拉下到本地  
git pull --rebase                       #强制覆盖本地版本
git clone [remote] [branch]                   #从远程仓库检出内容，并建立与本地的关联关系  

切换版本  
git reset HEAD^^^^^  --hard               #一个“^”代表返回一个版本 HEAD代表版本指针  
git reset --hard  版本号                         #切换到指定的版本  

版本回退
git rebase --continue                   #继续没有rebase完的操作

分支管理  
git branch                                            #查看分支  
git branch 分支名                                 #创建分支  
git checkout 分支名                             #切换到指定分支  
git checkout -b 分支名                         #创建并立即切换到分支  
git merge 分支名                                  #将指定分支合并到当前分支（或主分支）  
git branch -d 分支名                             #删除分支 
git branch -D 分支名                             #强制删除分支 
git branch -m  oldname newname                   #分支改名
git branch -M  oldname newname                   #分支强制改名
git branch -r                                   #列出远程分支
git branch -v                                   #列出分支
git branch --merged                             #查看已经合并的分支
git branch --no-merged                          #查看没有合并的分支
git branch -r --merged                          #查看远程合并的分支
git checkout -t origin/foo                      #取出远程分支foo  
git push -u origin foo                          #将分支推送到远程
git push origin :<remote branch>                #删除远程分支
git fetch -p

进度
git stash                                   #临时保存工作目录
git stash list                              #查看临时目录列表
git stash pop                               #恢复临时保存的内容到工作目录
git stash clear                             #删除临时保存列表

比对
git diff            #工作目录与暂存区比较  
git diff --cached    #暂存区与commit版本比较  
git diff HEAD     #工作目录与commit版本比较  
git diff \[hash] \[hash] 版本与版本的比较  
git diff HEAD HEAD~   版本与版本的比较"~"代表前一个版本  

git update-index --assume-unchanged /path/to/file       #忽略跟踪
git update-index --no-assume-unchanged ./storage/app/.gitignore #取消忽略


git config --global core.autocrlf false
git config --global core.safecrlf true
含义：
AutoCRLF
###提交时转换为LF，检出时转换为CRLF
git config --global core.autocrlf true

###提交时转换为LF，检出时不转换
git config --global core.autocrlf input

###提交检出均不转换
git config --global core.autocrlf false
SafeCRLF
###拒绝提交包含混合换行符的文件
git config --global core.safecrlf true

###允许提交包含混合换行符的文件
git config --global core.safecrlf false

###提交包含混合换行符的文件时给出警告
git config --global core.safecrlf warn

只下载最后一个版本  
git clone --depth=1 https://github.com/bcit-ci/CodeIgniter.git

git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short 图形化 
 
    git config --global alias.lr "log --pretty=format:'%h ↑ %cd → %cn -m:\"%s\"%d' --graph --date='relative'"  
    git config --global alias.ls "log --pretty=format:'%h ↑ %cd → %cn -m:\"%s\"%d' --graph --date='format-local:%Y-%m-%d %H:%M:%S'"   

git clean -d -fx ""  

如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。那么解决方法就是先把本地缓存删除（改变成未track状态），然后再提交： 
    
    git rm -r --cached .
    git add .
    git commit -m 'update .gitignore'

用git bash生成ssh公私钥  
ssh-keygen -t rsa -C "用户名"               #未指定用户生成ssh公私钥  

[Git深度使用经验总结](http://blog.csdn.net/kangear/article/details/13169395)







