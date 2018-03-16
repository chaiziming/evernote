###查看表结构
    select * from INFORMATION_SCHEMA.Columns where table_name='tago_test2' and table_schema='wwyt'
    
### 修改密码
    mysql>update mysql.user set authentication_string=password('新密码') where user='root' and Host ='localhost';
    mysql> ALTER USER USER() IDENTIFIED BY '新密码';
    
### 刷新权限：
    FLUSH PRIVILEGES;
    
### 创建数据库
    CREATE DATABASE db_name DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;