//
//  GLJTemp3ViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/15.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJTemp3ViewController.h"
#import "GLJCategory.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


@interface GLJTemp3ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSArray *categories;

@end

@implementation GLJTemp3ViewController

static NSString  *temp3leftCellID = @"temp3leftCellID";
static NSString  *temp3rightCellID = @"temp3rightCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第三控制器";
    
    [self.view addSubview:self.rightTableView];
    [self.view addSubview:self.leftTableView];
    
    [self.leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:temp3leftCellID];
    [self.rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:temp3rightCellID];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return self.categories.count;
    }
    
    GLJCategory *category = self.categories[self.leftTableView.indexPathForSelectedRow.row];
    return category.subcategories.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:temp3leftCellID];
        
        GLJCategory *category = self.categories[indexPath.row];
        leftCell.textLabel.text = category.name;
        leftCell.textLabel.highlightedTextColor = [UIColor greenColor];
        leftCell.imageView.image = [UIImage imageNamed:category.icon];
        leftCell.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
        return leftCell;
    }
    
    UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:temp3rightCellID];
    GLJCategory *category = self.categories[self.leftTableView.indexPathForSelectedRow.row];
    rightCell.textLabel.text = category.subcategories[indexPath.row];
    return rightCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        [self.rightTableView reloadData];
    }
    
}


#pragma mark getters
- (UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth * 0.5, KScreenHeight) style:UITableViewStylePlain];
        
        _leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
    }
    return _leftTableView;
}

- (UITableView *)rightTableView {
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(KScreenWidth * 0.5, 0, KScreenWidth *0.5, KScreenHeight) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
    }
    return _rightTableView;
}

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

@end
