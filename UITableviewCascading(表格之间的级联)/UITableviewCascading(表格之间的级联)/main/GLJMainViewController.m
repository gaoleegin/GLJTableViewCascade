//
//  GLJMainViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/15.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJMainViewController.h"

#import "GLJTemp1ViewController.h"
#import "GLJTemp2ViewController.h"
#import "GLJTemp3ViewController.h"

@interface GLJMainViewController ()

@property (nonatomic,strong) NSArray *titlesArray;

@property (nonatomic,strong) NSDictionary *classDictionary;

@end

@implementation GLJMainViewController


-(NSDictionary *)classDictionary {
    if (!_classDictionary) {
        _classDictionary = @{
                             @"第一种方式(两个子控制器)":[[GLJTemp1ViewController alloc]init],
                             @"第二种方式(一个view一个子控制器)":[[GLJTemp2ViewController alloc]init],
                             @"第三种方式(两个view)":[[GLJTemp3ViewController alloc]init]
                             };
    }
    return _classDictionary;
}




//- (NSArray *)titlesArray {
//    if (!_titlesArray) {
//        
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:NSStringFromClass([GLJTemp1ViewController class]),NSStringFromClass([GLJTemp2ViewController class]),NSStringFromClass([GLJTemp3ViewController class]), nil];
//        
//        _titlesArray = @[@"第一种方式(两个子控制器)",@"第二种方式(一个view一个子控制器)",@"第三种方式(两个view)"];
//    }
//    return _titlesArray;
//}

NSString *mainCellID = @"mainCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"表格之间的级联关系";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:mainCellID];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.classDictionary.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
    
    mainCell.textLabel.text = self.classDictionary.allKeys[indexPath.row];
    
    return mainCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *tempVC = self.classDictionary.allValues[indexPath.row];
    
    
    [self.navigationController pushViewController:tempVC animated:YES];
}

@end
