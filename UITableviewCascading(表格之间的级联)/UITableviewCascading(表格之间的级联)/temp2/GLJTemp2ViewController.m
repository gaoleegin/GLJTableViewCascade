//
//  GLJTemp2ViewController.m
//  UITableviewCascading(表格之间的级联)
//
//  Created by 高李军 on 16/6/15.
//  Copyright © 2016年 gaoleegin. All rights reserved.
//

#import "GLJTemp2ViewController.h"
#import "GLJTemp2RightViewController.h"
#import "GLJCategory.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface GLJTemp2ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *categories;

@property (nonatomic,strong)GLJTemp2RightViewController *rightVC;

@property (nonatomic,strong)UITableView *leftTableView;

@end



@implementation GLJTemp2ViewController


static NSString *temp2CellID = @"temp2CellID";


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
    self.title = @"第二控制器";
    
    
    UITableView *leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth * 0.5, KScreenHeight) style:UITableViewStylePlain];
    [leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:temp2CellID];
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    [self.view addSubview:leftTableView];
    self.leftTableView = leftTableView;
    
    
    GLJTemp2RightViewController *rightVC = [[GLJTemp2RightViewController alloc]init];
    rightVC.view.frame = CGRectMake(KScreenWidth * 0.5, 0, KScreenWidth * 0.5, KScreenHeight);
    [self addChildViewController:rightVC];
    [self.view addSubview:rightVC.view];
    self.rightVC = rightVC;
    
    GLJCategory *category = self.categories[0];
    
    NSArray *subCategory = category.subcategories;
    
    self.rightVC.subCategories = subCategory;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:temp2CellID];
    GLJCategory *category = self.categories[indexPath.row];
    cell.textLabel.text = category.name;
    cell.imageView.image = [UIImage imageNamed:category.icon];
    cell.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GLJCategory *category = self.categories[indexPath.row];
    NSArray *subCategory = category.subcategories;
    self.rightVC.subCategories = subCategory;
}

@end
