### JDK

### 命名
> package 规范

    例如 com.icss.pet.ui
    范围.公司.项目名.层
    全小写
    
> class 规范

    首字母大写
    
> 对象命令
    
    首字母小写
    例如
    User user = new User();
    
### 实体类
> entity 只有属性，没有方法
> POJO (plain old java object)简单java类
> VO (value object)
> DTO (data transfer object)

作用是夸层进行数据传输

### 方法重载
> 方法同名不同参（相当于PHP默认参数）
   
   
### 构造方法重写
> super() 方法传参向父类构造方法

### is - a 关系
> 继承 子类和父类是is-a的关系 子是父类

### has -a 关系
> 班级包含学生

### protected 
> 包内的外部类可以，包外的外部类不行

### 默认关键字 frindly
> 类属性默认的修饰符，与protected不同的是包外子类不能调用，在包内
相当于public

### final 
> 类不希望被继承，方法不希望被重写但能重载，属性不希望被修改，变量等同于常量

### static
> 
1. static 方法

    静态方法内不能调用成员变量
    
2. static 变量 

3. static 代码块

   作用：为静态变量初始化。
   特点：比调用构造方法还优先调用并且只被调用一次
   
   
        static {
               
        }
        
        
### servlet
> 相当于php controller 
包含了 response request对象