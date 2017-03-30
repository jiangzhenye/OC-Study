# BigShow1949

##### 各类知识点总结成Demo,主要分成17大类, 每周都会更新
1.pch文件直接拖拽到 Build Setting -> Prefix Header 中，并且Precompile Prefix Header设置为YES
2.当我们希望一个变量的作用域不仅仅是作用域某个类的某个对象，而是作用域整个类的时候，这时候就可以使用静态变量static。static修饰的变量，是一个私有的全局变量。static修饰的变量必须放在@implementation外面或方法中，它只在程序启动初始化一次。
  如果需要定义一个时间间隔的静态常量，就可以使用const修饰。const修饰的变量是不可变的 如果试图修改编译器则会报错。  当我们定义一个对象类型常量的时候，要将const修饰符放到*指针指向符后面。
  static NSString * const LMJName = @"iOS开发者公会";
3.通知、代理、block
通知

： 一对一  一对多  传值
四个步骤:
1.发送通知
2.创建监听者
3.接收通知
4.移除监听者

使用场景:
1- 很多控制器都需要知道一个事件，应该用通知；
2 - 相隔多层的两个控制器之间跳转

注意事项:
1, 一旦接收消息的对象多了，就难以控制了，可能有你不希望的对象接受了消息并做了处理
2,创建了观察者，在dealloc里面一定要移除；

代理

“一对一”，对同一个协议，一个对象只能设置一个代理delegate


六个步骤:
1.声明一个协议,定义代理方法
2. 遵循协议
3.设置一个代理对象
4.调用代理方法
5.给代理赋值
6.实现代理方法

注意事项:

1,单例对象不能用代理；
2,代理执行协议方法时要使用 respondsToSelector检查其代理是否符合协议(检查对象能否响应指定的消息),以避免代理在回调时因为没有实现方法而造成程序崩溃



使用场景:

公共接口，方法较多也选择用delegate进行解耦
iOS最常用tableViewDelegate，textViewDelegate
iOS有很多例子比如常用的网络库AFNetwork，ASIHTTP库，UIAlertView类。

block
使用场景：
一：动画
二：数据请求回调
三：枚举回调
四：多线程gcd
...

异步和简单的回调用block更好
BLOCK最典型的是大所周知的AFNETWORK第三方库。

注意事项:

block需要注意防止循环引用：
ARC下这样防止：
__weak typeof(self) weakSelf = self;
[yourBlock:^(NSArray *repeatedArray, NSArray *incompleteArray) {
[weakSelf doSomething];
}];

非ARC
__block typeof(self) weakSelf = self;
[yourBlock:^(NSArray *repeatedArray, NSArray *incompleteArray) {
[weakSelf doSomething];
}];

delegate 和 block对比


效率：Delegate比NSNOtification高；

1,   Delegate和Block一般都是一对一的通信；


2,   Delegate需要定义协议方法，代理对象实现协议方法，并且需要建立代理关系才可以实现通信；

Block：Block更加简洁，不需要定义繁琐的协议方法，但通信事件比较多的话，建议使用Delegate；


3,  delegate运行成本低。block成本很高的。
block出栈需要将使用的数据从栈内存拷贝到堆内存，当然对象的话就是加计数，使用完或者block置nil后才消除；delegate只是保存了一个对象指针，直接回调，没有额外消耗。相对C的函数指针，只多做了一个查表动作 .

4，代理更注重过程信息的传输：比如发起一个网络请求，可能想要知道此时请求是否已经开始、是否收到了数据、数据是否已经接受完成、数据接收失败
block注重结果的传输：比如对于一个事件，只想知道成功或者失败，并不需要知道进行了多少或者额外的一些信息


5 Blocks 更清晰。比如 一个 viewController 中有多个弹窗事件，Delegate 就得对每个事件进行判断识别来源。而 Blocks 就可以在创建事件的时候区分开来了。这也是为什么现在苹果 API 中越来越多地使用 Blocks 而不是 Delegate。 

4.http 配置
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>

