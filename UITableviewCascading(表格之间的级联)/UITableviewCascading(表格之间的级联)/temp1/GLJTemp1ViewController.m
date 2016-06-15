//
//  ViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJTemp1ViewController.h"
#import "GLJLeftViewController.h"
#import "GLJRightViewController.h"

/**
 *  两个表格之间的级联的关系，实现方式
    
    1.父控制器上面添加两个子控制器，两个UITableViewController
    2.在一个父控制器上面添加一个UITableView，去控制另一个子控制器
    3.两个UITableView互相切换控制
 */

@interface GLJTemp1ViewController ()

@end

@implementation GLJTemp1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width * 0.5;
    CGFloat height = self.view.frame.size.height;
    
    //添加右边的控制器
    GLJRightViewController *rightVC = [[GLJRightViewController alloc]init];
    rightVC.tableView.frame = CGRectMake(width, 0, width, height);
    [self.view addSubview:rightVC.tableView];
    [self addChildViewController:rightVC];
    
    //添加左边的控制器
    GLJLeftViewController *leftVC = [[GLJLeftViewController alloc]init];
    leftVC.tableView.frame = CGRectMake(0, 0, width, height);
    
    leftVC.delegate = rightVC;
    [self.view addSubview:leftVC.tableView];
    [self addChildViewController:leftVC];
    
    [leftVC.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
