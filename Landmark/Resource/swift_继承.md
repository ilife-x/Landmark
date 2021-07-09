

###方法

```swift 
//全局变量
var num = 8

class Car{
    //static:类型属性,本质就是全局变量,内存中只有一份,和全局变量的区别只有访问权限控制的区别
    //static:默认就是lazy的,在第一次访问的时候初始化
    //static:修饰的变量,初始化在swift_once中,swift_once底层调用的就是gcg的dispatch_once,是线程安全的
    static var count = 10
}
```

```swift
class Car{
    static var count = 10
    var age = 22;
    
    init() {
        Car.count += 1
    }
    
    //类型方法
    static func getCount()->Int{
        //等价于self.count ,这里的self 相当于类型Car
        count

    }
    //实例方法
    func getAge() -> Int {
        //等价于self.age,这里的self相当于实例
        age
    }
}

print(Car.getCount())
print(Car().age)
```



### Mutating

枚举和结构体是值类型，默认情况下，是不允许自己内部的示例方法去修改自己的属性的，如果需要，则在方法面前加上mutating就可以了

```swift
struct Point {
    var x = 0,y = 0
    
   mutating func moveBy(dx:Int,dy:Int){
        x+=dx
        y+=dy
    }
}
```

```swift
enum swithState {
    //开关的三个状态
    case Low,Middle,Hight
    
    //定义一个方法,切换开关状态
   mutating func next() {
        switch self {
        case .Low:
            self = .Middle
        case .Middle:
            self = .Hight
        case .Hight:
            self = .Low
        }
    }
}
```

返回值，没有用到，就会报这个警告：*Result of call to 'moveBy(dx:dy:)' is unused*

```swift
struct Point2 {
    var x = 0,y = 0
    // @discardableResult 消除返回值未使用的警告
  @discardableResult mutating func moveBy(dx:Int,dy:Int)->Int{
        x+=dx
        y+=dy
    return x
    }
}
var p = Point2()
// 如果没有@discardableResult，此处返回值未使用，会报警告
p.moveBy(dx: 3, dy: 2)

```



### 下标

下标的本质就是方法，就是函数

可以给任意类型（类，结构体，枚举）添加下标功能 ，以便通过脚标来设置和访问属性

```swift
class Student {
    var age = 0.0
    var count = 0.0
    //通过 subscript 给属性添加脚标
    subscript(index:Int)->Double{
        //set 方法可以不写
        set{
            if index == 0{
                age = newValue
            }else if index == 1{
                count = newValue
            }
        }
        //get方法,必须写,只读属性
        get{
            if index == 0 {
                return age
            }else if index == 1{
                return count
            }
            return 0
        }
    }
}

// 可以通过脚标来设置和访问属性
var stu = Student()
stu[0] = 20
stu[1] = 30.2
print("通过脚标访问:\(stu[0]),\(stu[1])")
print("通过属性访问:\(stu.age),\(stu.count)")
```

get 方法必须有，为只读属性，只有get的时候可以省略get

```swift
class Student {
    var age = 0.0
    var count = 0.0
    //通过 subscript 给属性添加脚标
    subscript(index:Int)->Double{
        //get方法,必须写,只读属性
        if index == 0 {
            return age
        }else if index == 1{
            return count
        }
        return 0
    }
}
// 可以通过脚标来设置和访问属性
var stu = Student()
print("通过脚标访问:\(stu[0]),\(stu[1])")
print("通过属性访问:\(stu.age),\(stu.count)")
```

```swift
//方法可以带参数标签
class Student {
    var age = 0.0
    var count = 0.0
    //方法添加参数标签
    subscript(index i:Int)->Double{
        if i == 0 {
            return age
        }else if i == 1{
            return count
        }
        return 0
    }
}

// 可以通过脚标来设置和访问属性,访问的时候需要带参数标签来访问
var stu = Student()
print("通过脚标访问:\(stu[index:0]),\(stu[index:1])")
print("通过属性访问:\(stu.age),\(stu.count)")
```

```swift
//下标可以是类型方法
class Sum {
    static subscript(v1:Int,v2:Int)->Int{
        v1 + v2
    }
}
print(Sum[10,20])
```



### 继承

只有类，支持继承，只有引用类型，才支持继承

没有父类的类，为基类

不是所有的类都必须和oc一样，继承自NSobjct

```swift
//Animal 占32个字节,引用类型固定16个字节(8个用来存放地址,8个用来引用计数)属性占8个,内存对齐:16的倍数
class Animal {
    var age = 0
}
//Dog 占用32拥有父类的所有属性
class Dog: Animal {
    var count = 0
}
//Erha占用48,拥有父类的所有属性
class Erha: Dog {
    var num = 0
}
```

#### 类型方法的重写

```swift
class Animal {
    //定义类型方法可以用class和static 来修饰
    class func speak() {
        print(" animal speak")
    }
    
    static func run(){
        print("animal run")
    }
}
class Dog: Animal {
    //子类可以重写父类用class定义的类型方法,不能重新用static修饰的类型方法
    //父类用class定义类型方法,子类可以修改为static修饰
    override class func speak() {
        print("dog speak")
    }
}
```

子类可以将父类的属性（存储，计算）重写为计算属性，不能重写为存储属性

```swift 
class Circle {
    var radius:Int = 0
    var diameter:Int {
        
        set{
            radius = newValue/2
        }
        
        get{
            return radius * 2
        }
    }
    
    
}

class subCircle: Circle {
    override var radius: Int{
        set{
            super.radius = newValue > 0 ? newValue : 0
        }
        get{
            return super.radius
        }
    }
    
    override var diameter: Int{
        set{
            super.diameter = newValue > 0 ? newValue : 0
        }
        
        get{
            return super.diameter
        }
    }
}
```

