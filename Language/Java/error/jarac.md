### java *.class
> Error: Could not find or load main class  
> 当前目录是.class文件所在目录，要运行.class字节码文件，需要将当前目录加入系统变量CLASSPATH，
> 系统才能找到当前目录下的Java类


    CLASSPATH=$CLASSPATH:/home/czm/test/corejava/v1ch02/Welcome
    
    [czm@localhost Welcome]$ echo $CLASSPATH
    /usr/java/jdk1.8.0_162/lib/tools.jar:/usr/java/jdk1.8.0_162/lib/dt.jar:/usr/java/jdk1.8.0_162/lib:/home/czm/test/corejava/v1ch02/Welcome
    
    [czm@localhost Welcome]$ java Welcome
    Welcome to Core Java!
    =====================

### 
> Java 中的 main 方法必须是静态的 。 
> Java 应用程序的退出代码为 0 ,表示成功地运行了程序。
没有后缀 F 的浮点数值 ( 如 3.14 ) 默
float 类型的数值有一个后缀 F 或 f ( 例如 , 3.14 F 。
认为 double 类型 。 当然 , 也可以在浮点数值后面添加后缀 D 或 d ( 例如 , 3.14 D ) 。