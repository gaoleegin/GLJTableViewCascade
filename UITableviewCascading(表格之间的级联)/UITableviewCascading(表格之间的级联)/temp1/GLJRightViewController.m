//
//  GLJRightViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJRightViewController.h"

@interface GLJRightViewController ()

@property (nonatomic,strong) NSArray *subCategoriesArray;

@end



@implementation GLJRightViewController

static NSString *rightcellID = @"rightcellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:rightcellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.subCategoriesArray.count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightcellID];
    
    cell.textLabel.text = self.subCategoriesArray[indexPath.row] ;
    
    return cell;
}


- (void)leftViewController:(GLJLeftViewController *)leftViewController didSelectRowAtSubcategories:(NSArray *)subcategories {
    self.subCategoriesArray = subcategories;
    
    [self.tableView reloadData];
}



@end
