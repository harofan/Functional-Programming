//
//  Person.m
//  Functional-Programming
//
//  Created by fy on 16/8/11.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "Person.h"

@implementation Person
#pragma mark - 链式编程 -
-(Person *)eat{
    
    NSLog(@"吃");
    
    return self;
}

-(Person *)drink{
    
    NSLog(@"喝");
    
    return self;
}

#pragma mark - 函数式编程 -
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

#pragma mark - 带有参数的函数式编程 -
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

@end
