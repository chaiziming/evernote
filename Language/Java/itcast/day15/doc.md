###教学点
1. equals 默认是比较两个对象的地址（没意义），重写equals方法注意对象参数的向下转型
2. 重写头toString方法要求输出对象成员变量（不含静态属性）
3. 使用byte字节码构造字符串字节码小于0的代表汉字
4. 常用字符方法 substring，startWith，endWith，contains，charAt，indexOf，getBytes，toCharArray，equalsIgnoreCase，toUpperCase
                toLowerCase
5. 65~90是大写，97~122是小写，48~57是数字
6. StringBuffer（线程安全（快））（StringBuilder（线程不安全（慢）））类 insert append delete replace reverse