//
//  GLJLeftViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/14.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJLeftViewController.h"
#import "GLJCategory.h"

@interface GLJLeftViewController ()

/**
 *  存放分类的数组
 */
@property (nonatomic, strong) NSArray *categories;

@end

@implementation GLJLeftViewController


static NSString *leftcellID = @"leftcellID";

- (NSArray *)categories {

    if (!_categories) {
        
        NSArray *categoryArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *categoriesMuata = [NSMutableArray array];
        
        for (NSDictionary *dict in categoryArray) {
            GLJCategory *category = [[GLJCategory alloc]initWithDict:dict];
            [categoriesMuata addObject:category];
        }
        _categories = categoriesMuata;
    }
    return _categories;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftcellID];
    
    //内嵌边距
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
    [self callDelegateSelectRow:0];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftcellID];
    GLJCategory *category = self.categories[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:category.icon];
    cell.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
    cell.textLabel.text = category.name;
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self callDelegateSelectRow:indexPath.row];
}


/** 主动选择第一行 */
- (void)callDelegateSelectRow:(NSInteger)row {
    
    GLJCategory *category = self.categories[row];
    
    NSArray *subCategory = category.subcategories;
    
    if ([self.delegate respondsToSelector:@selector(leftViewController:didSelectRowAtSubcategories:)]) {
        [self.delegate leftViewController:self didSelectRowAtSubcategories:subCategory];
    }
    
}

@end
