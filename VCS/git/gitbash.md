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


同步远程仓库  
git remote -v                                        #查看与远程仓库的链接的别名  
git remote add [shortname] [url]           #增加远程仓库，并命名  
git remote remove [shortname]            #删除指定别名  
git push [remote] [branch]                    #将本地的提交推送到远程仓库  
git push --set-upstream [alise]         #set main push
git pull [remote] [branch]                      #将远程仓库的提交拉下到本地  
git clone [remote] [branch]                   #从远程仓库检出内容，并建立与本地的关联关系  

切换版本  
git reset HEAD^^^^^  --hard               #一个“^”代表返回一个版本 HEAD代表版本指针  
git reset --hard  版本号                         #切换到指定的版本  

分支管理  
git branch                                            #查看分支  
git branch 分支名                                 #创建分支  
git checkout 分支名                             #切换到指定分支  
git checkout -b 分支名                         #创建并立即切换到分支  
git merge 分支名                                  #将指定分支合并到当前分支（或主分支）  
git branch -d 分支名                             #分支名  

比对
git diff            #工作目录与暂存区比较
git diff --cached    #暂存区与commit版本比较

git update-index --no-assume-unchanged ./storage/app/.gitignore #取消忽略

git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short 图形化 
 
    git config --global alias.lr "log --pretty=format:'%h ↑ %cd → %cn -m:\"%s\"%d' --graph --date='relative'"  
    git config --global alias.ls "log --pretty=format:'%h ↑ %cd → %cn -m:\"%s\"%d' --graph --date='format-local:%Y-%m-%d %H:%M:%S'"   

git clean -d -fx ""  

用git bash生成ssh公私钥  
ssh-keygen -t rsa -C "用户名"               #未指定用户生成ssh公私钥  







