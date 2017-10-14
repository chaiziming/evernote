[源](http://www.cnblogs.com/GreenForestQuan/p/6496431.html)

 步骤：
1. 备份原来 phpStudy 中 MySQL 安装目录
 
2. 把下载的 MySQL 压缩文件解压至 phpStudy 下的 MySQL目录，复制 my-default.ini ，重命名为 my.ini。
打开 my.ini，找到 #basedir 处编辑：
basedir = D:\phpStudy7\MySQL
datadir = D:\phpStudy7\MySQL\data
 注：有任何错误都是因为以上路径配置错误导致的
 
3. 把 MySQL 安装路径添加至系统环境变量
过程：计算机—>系统属性—>高级系统配置—>环境变量
选择PATH,在其后面添加: 你的mysql bin文件夹的路径 (如：我的是:D:\phpStudy7\MySQL\bin ) 修改后的PATH为：
PATH=…….;D:\phpStudy7\MySQL\bin (需注意：1.必须在原有PATH后加英文输入下的分号；2.是追加,不是覆盖。)
 
4. 在 cmd 下进入 MySQL 的 bin 目录（我的是 D:\phpStudy7\MySQL\bin），执行：
初始化数据库：
mysqld --initialize
 

5. 安装服务：
mysqld -install
 
启动服务：
net start MySQL

6. 此时登入 MySQL 报错：
C:\Users\dell>mysql -uroot -p Enter password: **** ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
尝试修改 root 用户密码：
打开 my.ini，找到 [mysqld]，在下面添加：
skip-grant-tables(此参数用于忘记mysql密码)
此时使用 root 账号，密码处按回车即可登录。
 
修改密码：
mysql>update mysql.user set authentication_string=password('新密码') where user='root' and Host ='localhost';
mysql> ALTER USER USER() IDENTIFIED BY '新密码';
 

刷新权限：
FLUSH PRIVILEGES;
 

注释掉 my.ini 中刚才添加的
skip-grant-tables
重新登录。
 
此时查看 mySQL 版本：
mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.17 |
+-----------+
 