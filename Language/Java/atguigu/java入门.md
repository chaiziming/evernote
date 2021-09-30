## JAVA

> 从JDK7 开始由 oracle 接管，主流是JDK8版本，目前到JDK17了，JDK8就JDK1.8，以后就是每半年一个版本
>
> 038 第一个 java 程序的总结

<b style="color:red">注： 在 java 源文件可以声明多个类但是只有一个类可声明为 public  这个必须与文件同名 </b>

<b style="color:red">注： 编译以后，会根据文件中的声明的 class 的数量来生成一个或多个 .class 文件，文件名和 class 名相对应</b>

<b style="color:red">注：byte、short、char 相互运算结果都是 int 包括同类型的如 byte + byte = int</b>

![java_structure](C:\Project\ABC\evernote\Language\Java\atguigu\img\java_structure.png)

### Java SE   文档

  [JDK8](https://docs.oracle.com/javase/8/)

### JDK  安装

Centos7 

从官网下载安装包然后解压

```shell
# 这里以 jkd8 为例
wget https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz
tar -xf jdk-8u41-b04
mv jdk-8u41-b04 /usr/local/jdk8
vim /etc/profile
```

设置环境变量

```shell
# 设置环境变量
export JAVA_HOME=/usr/local/jdk8
# 文件最后加上
export PATH=$PATH:$JAVA_HOME/bin
```

加载环境变量

```shell
. /etc/profile
# 完成
java -version
```

### 文档注释

```java
/**
 * doc comment
 * @author ziming.chai
 * @version v1.0
 */
public class HelloJava {
        /**
        test 
        */
        public static void main(String[] args) {
                System.out.println("Hello World!");
        }
}
```

生成文档

```shell
# -d 目录
javadoc -d myHelloDoc -author -version HelloJava.java
```

### javac & java 命令

javac 是编译 java 文件的执行文件，编译后.java 文件变成 .class 字节码文件，然后由 java执行文件运行 .class 文件

```shell
javac HelloJava.java
java HelloJava
```

### println 和 print 区别

System.out.println() 换行，System.out.print() 不换行

### JDK、JRE 包含的主要结构

JDK = JRE + Java 的开发工具（javac，java， javadoc ...）

JRE = JVM + Java 核心类库

### 043 关键字和保留字

其他修饰符：native strictfp transient volatile assert

保留字：goto const

### 命名规范

包名：所有字母都是小写 xxxyyyzzz

类名和接口名：所有单词大驼峰写法 XxxYyyZzz

变量名和方法名：所有单子小驼峰写法 xxxYyyZzz

常量名：所有字母都大写，单词有下划线分开 XXX_YYY_ZZZ

### 变量类型

基本类型：整型、浮点、字符、布尔

> 整型：byte、short、int、long 分别占用 2 的 0、1、2、3 次方的字节，定义 long 的时必须以“l”或“L”结尾，通常用 int
>
> 浮点：定义 float 时 要以 “f” 或 “F” 结尾，通常用 double

```java
long number = 123456789L;
float f1 = 12.3F;
```



引用类型：类、接口、数组

### 类型转换

> 这里只讨论7种基本类型的转换，不包含boolean

类型提升

```JAVA
/***************************/
//byte -> int
byte b1 = 2;
int i1 = 129;
//byte b2 = b1 + i1; 这样会导致错误
int b2 = b1 + i1;

/***************************/
// 字符和数值相加，会以字符码和数值相加
char c1 = 'a';
int i3 = 10;
int i4 = c1 + i3; //print out 107

/***************************/
// byte、short、char 相互运算结果都是 int 包括同类型的如 byte + byte = int
short s2 = 10;
char c2 = c1 + s2; // 编译报错
byte b2 = 10;
char c3 = c1 + b2; // 编译报错
short s4 = b1 + b2; //编译报错

```

