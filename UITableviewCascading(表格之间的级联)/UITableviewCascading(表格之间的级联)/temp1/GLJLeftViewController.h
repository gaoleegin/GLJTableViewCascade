//
//  GLJLeftViewController.h
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 左边的控制器
 */


@class GLJLeftViewController;

@protocol GLJLeftViewControllerDelegate <NSObject>

@optional

- (void)leftViewController:(GLJLeftViewController *)leftViewController didSelectRowAtSubcategories:(NSArray *)subcategories;

@end


@interface GLJLeftViewController : UITableViewController

/** 代理 */
@property(nonatomic,weak) id<GLJLeftViewControllerDelegate> delegate;

@end
