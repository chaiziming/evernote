### 概要
    systemctl status iptables.service
    systemctl status firewalld.service
    systemctl start httpd
    systemctl enable httpd
### firewall-config
> 图形化的

zong 有9个代表9个等级 上到下完全信任到完全不信任，默认是public
    
    block           拒绝，绝对不信任
    dmz
    drop            丢弃（不常用）
    external
    home
    internal
    public
    trusted         通过，绝对信任
    work

每个等级都能添加源（add-sources）且一个源只能属于一个等级，不能同时属于多个等级。  
将请求引流到这个等级，每个等级都能开放本机的所有服务  
只有开放了服务才能从当前等级限制中通过（block，trusted例外）

图形化有Configuration选项，其含有Runtime和Permanent两种： 
Permanent 是永久的加入防火墙配置中，每次修改后必须要reload下，才能生效。    
Runtime 是临时加入防火墙配置中，不用reload就能生效，但是reload之后会消失。  


interface必须属于某一个zong  
source和interface与zone的绑定是有优先级的，先source在interface最后默认zone

### 