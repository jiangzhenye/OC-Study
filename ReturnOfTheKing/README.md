# BigShow1949

##### 各类知识点总结成Demo,主要分成17大类, 每周都会更新
1.pch文件直接拖拽到 Build Setting -> Prefix Header 中，并且Precompile Prefix Header设置为YES
2.当我们希望一个变量的作用域不仅仅是作用域某个类的某个对象，而是作用域整个类的时候，这时候就可以使用静态变量static。static修饰的变量，是一个私有的全局变量。static修饰的变量必须放在@implementation外面或方法中，它只在程序启动初始化一次。
  如果需要定义一个时间间隔的静态常量，就可以使用const修饰。const修饰的变量是不可变的 如果试图修改编译器则会报错。  当我们定义一个对象类型常量的时候，要将const修饰符放到*指针指向符后面。
  static NSString * const LMJName = @"iOS开发者公会";
