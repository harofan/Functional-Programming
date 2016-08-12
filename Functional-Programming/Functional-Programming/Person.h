//
//  Person.h
//  Functional-Programming
//
//  Created by fy on 16/8/11.
//  Copyright © 2016年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//链式编程
-(Person *)eat;

-(Person *)drink;

//函数式编程
-(Person * (^)())eat1;

-(Person * (^)())drink1;

//带有参数的函数式编程
-(Person * (^)(NSString * food))eat2;

-(Person * (^)(NSString * forDrinkingSth))drink2;

@end
