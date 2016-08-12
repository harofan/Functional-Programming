# Functional-Programming
关于函数式编程&amp;链式编程的个人见解

If you have some questions, please tell me.

My email address is fanyang_32012@outlook.com.

## 函数式编程思想&&链式编程思想在Masonry框架中的体现

- Masonry框架是这样子使用的

        [view mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerX.equalTo(self.view);

            make.centerY.equalTo(self.view);

            make.size.mas_offset(CGSizeMake(100, 100));

        }];

Masonry能非常好的体现出函数式编程和链式编程的思想以及做法

链式编程就像Masonry中,make能够一直点下去一样,至于怎么做我们后面会详细讲到他的原理很简单类似于这样

        id obj1 = [make centerX];

        id obj2 = [obj1 equalTo()];

每次执行完都会有一个返回值,这个返回值是个对象,一般是返回'类'自己本身的对象

函数式编程思想就像equalTo()一样,OC中我们一般使用方括号表示执行方法,()一般表示执行block,所以我们这里一般指的是执行一个block,且传入
的参数是self.view

函数式编程写法上的实现主要体现在返回值是一个block

## 链式编程的写法

- 首先我们先创建一个Person类,在Person类下写两个对象方法

        -(Person *)eat{

            NSLog(@"吃");

            return self;
        }

        -(Person *)drink{

            NSLog(@"喝");

            return self;
        }

链式编程的写法非常简单,只要返回值是一个可以继续调用对象方法的对象就可以,我们一般返回的是自身,使用起来就像这样

        Person * person = [[Person alloc]init];

        //这里的eat方法和drink方法每次执行完都会返回Person自身,所以能够一直执行下去

        person.eat.drink.eat.drink;

## 函数式编程

- 我们在Person类下写两个返回值为block的对象方法

        -(Person *(^)())eat1{

            Person * (^block)()=^{

                NSLog(@"吃1");

                return self;
            };

            return block;
        }

        //简便式写法
        -(Person *(^)())drink1{

            return ^(){

                NSLog(@"喝1");

                return self;
            };
        }

这两种写法第一种理解起来比较简单,创建一个block,这个block的返回值是类自身即可,最后将这个block返回就可以.

        Person * person = [[Person alloc]init];

        //这里不会有()的自动补全,需要开发者自己加上

        person.eat1().drink1();

## 带参数的函数式编程

- 即在函数式编程的基础上,在返回值的block上加上参数

        -(Person *(^)(NSString *))eat2{

            Person * (^block)(NSString * food) = ^(NSString * food){

                NSLog(@"吃%@",food);

                return self;
            };

            return block;
        }

        //简便写法

        -(Person *(^)(NSString *))drink2{

            return ^(NSString * drinkSth){

                NSLog(@"喝%@",drinkSth);

                return self;
            };

        }

同样是两种写法,使用的时候只要给block传入参数就可以了

        Person * person = [[Person alloc]init];

        //这里不会有()的自动补全,需要开发者自己加上

        person.eat2(@"包子").drink2(@"水");

###至此函数式编程就暂时学习完了,函数式编程对于像我这样的新手来讲平时用的还是比较少的,主要就用在编写框架和阅读框架上吧,最近正在学习RAC,所以来特地来学习一下函数式编程以提高自己的编程水平