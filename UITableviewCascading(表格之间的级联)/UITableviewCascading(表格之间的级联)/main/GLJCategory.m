//
//  GLJCategory.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJCategory.h"

@implementation GLJCategory

- (instancetype)initWithDict:(NSDictionary *)dict {
    GLJCategory *category = [[GLJCategory alloc]init];
    /**
     *  利用kvc进行赋值操作
     */
    [category setValuesForKeysWithDictionary:dict];
    
    return category;
}

@end
