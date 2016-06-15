//
//  GLJCategory.h
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLJCategory : NSObject

/** 子分类 */
@property(nonatomic,strong) NSArray *subcategories;

/** 分类名字 */
@property(nonatomic,copy) NSString *name;

/** 普通房状态下的名字 */
@property(nonatomic,copy) NSString *icon;

/** 高亮状态下的名字 */
@property(nonatomic,copy) NSString *highlighted_icon;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
