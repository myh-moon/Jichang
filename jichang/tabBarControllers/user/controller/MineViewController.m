//
//  MineViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/22.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mineTableView;
@property (nonatomic,strong) UIView *headerView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户体验";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"扫" style:UIBarButtonItemStylePlain target:self action:@selector(saosao)];
    
//    [self.view addSubview:self.mineScrollView];
    [self.view addSubview:self.mineTableView];
    [self.view addSubview:self.headerView];
    
    [self.view setNeedsUpdateConstraints];
    
//    self.manager = [[RETableViewManager alloc] initWithTableView:self.mineTableView delegate:self];
    
//    [self setupMineTableView];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.mineTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [self.headerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge: ALEdgeBottom];
        [self.headerView autoSetDimension:ALDimensionHeight toSize:80];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

//- (void)setupMineTableView {
//    RETableViewSection *section = [RETableViewSection section];
//    section.headerHeight = 0;
//    section.footerHeight = 0;
//    [self.manager addSection:section];
//
//    for (NSInteger i=0; i<40; i++) {
//        RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:@"sd"];
//        [section addItem:item];
//    }
//}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [UIView newAutoLayoutView];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

- (UITableView *)mineTableView {
    if (!_mineTableView) {
        _mineTableView = [UITableView newAutoLayoutView];
        _mineTableView.backgroundColor = [UIColor greenColor];
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
        
        UIView *ssss = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCWindowWidth, 90)];
        ssss.backgroundColor = [UIColor orangeColor];

        _mineTableView.tableHeaderView = ssss;

        _mineTableView.tableFooterView = [UIView new];
    }
    return _mineTableView;
}

#pragma mark - tableview delegate and datasource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行文本",(long)indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
    NSLog(@"偏移量：%f",offY);
    if (offY  <= 0) {
        [self.headerView autoSetDimension:ALDimensionHeight toSize:(80+fabs(offY))];
    }else{
        
    }
    
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    if (scrollView == self.mineTableView) {
//        CGFloat offY = scrollView.contentOffset.y;
//
//        if (offY <= 0) {
//            if (self.mineTableView.mj_origin.y == 0) {
//                [self.headerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
//                [self.headerView autoSetDimension:ALDimensionHeight toSize:80];
//                [self.mineTableView autoPinToTopLayoutGuideOfViewController:self withInset:fabs(offY)];
//            }else{
//                [self.headerView autoSetDimension:ALDimensionHeight toSize:80];
//            }
//        }else{
//            if (offY < 80) {
//                [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-offY];
//                [self.headerView autoSetDimension:ALDimensionHeight toSize:offY];
////                [self.headerView autoPinToTopLayoutGuideOfViewController:self withInset:0];
//                [self.mineTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:offY];
//            }else{
//                [self.headerView autoSetDimension:ALDimensionHeight toSize:80];
//                [self.headerView autoPinToTopLayoutGuideOfViewController:self withInset:0];
//
//            }
//        }
//    }
//}

- (void) saosao {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
