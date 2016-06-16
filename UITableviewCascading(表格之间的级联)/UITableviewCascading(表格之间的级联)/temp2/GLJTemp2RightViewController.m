//
//  GLJTemp2RightViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/15.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJTemp2RightViewController.h"

@interface GLJTemp2RightViewController ()

@end

@implementation GLJTemp2RightViewController

static NSString *temp2RightViewID = @"temp2RightViewID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:temp2RightViewID];
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:temp2RightViewID];
    
    cell.textLabel.text = self.subCategories[indexPath.row];
    
    return cell;
}

- (void)setSubCategories:(NSArray *)subCategories {
    _subCategories = subCategories;
    [self.tableView reloadData];
}



@end
