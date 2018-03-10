###浏览器登陆bug
>Fedora27下使用Firefox访问登陆页面填写密码时会禁用输入法（此时使用的如果不是en输入源(libpinyin切换英文状态也不行)会有95%的概率导致  
gnome-shell崩溃退出到登陆界面。

解决方法是：访问"about:config"，找到"intl.ime.use_simple_context_on_password_field"，将其改为true。

### 解决gnome频繁崩溃

    gsettings set org.gnome.SessionManager auto-save-session false
    
### 重启Gnome Shell只需一个字母

Alt+F2，输入r。  
Alt+F2，输入lg，打开gjs调试窗口。