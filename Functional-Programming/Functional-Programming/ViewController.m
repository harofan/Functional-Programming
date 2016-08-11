//
//  ViewController.m
//  Functional-Programming
//
//  Created by fy on 16/8/11.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createMas];
}

-(void)createMas{
    
    UIView * view = [[UIView alloc]init];
    
    [self.view addSubview:view];
    
    view.backgroundColor = [UIColor greenColor];
/*
 Masonry能非常好的体现出函数式编程和链式编程的思想以及做法
 
 链式编程就像Masonry中,make能够一直点下去一样,至于怎么做我们后面会详细讲到他的原理很简单类似于这样
 
 id obj1 = [make centerX];
 id obj2 = [obj1 equalTo()];
 
 每次执行完都会有一个返回值,这个返回值是个对象,一般是返回'类'自己本身的对象
 
 函数式编程思想就像equalTo()一样,OC中我们一般使用方括号表示执行方法,()一般表示执行block,所以我们这里一般指的是执行一个block,且传入的参数是self.view
 
 */
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(100, 100));
    }];
}

@end
