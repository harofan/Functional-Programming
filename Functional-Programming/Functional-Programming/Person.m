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

@end
