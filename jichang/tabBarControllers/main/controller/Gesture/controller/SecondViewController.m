//
//  SecondViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic,strong) RETableViewManager *manager;
@property (nonatomic,strong) UITableView *secondTableView;
@property (nonatomic,strong) UIView *sideView;

@property (nonatomic,strong) NSLayoutConstraint *leftConstraints;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"侧边栏";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    [self.leftBtn setTitle:@"点击" forState:0];
    [self.leftBtn addTarget:self action:@selector(showSideView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.sideView];
    [self.view addSubview:self.secondTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.leftConstraints  = [self.secondTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.secondTableView];
    
    [self setupSecondTableView];
}


- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.sideView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
//        [self.secondTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
        [self.secondTableView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.secondTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.secondTableView autoSetDimension:ALDimensionWidth toSize:JCWindowWidth];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) setupSecondTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    for (NSInteger i=0; i<20; i++) {
        RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:@"测试测试"];
        [section addItem:item];
    }
}

- (UIView *)sideView {
    if (!_sideView) {
        _sideView = [UIView newAutoLayoutView];
        _sideView.backgroundColor = [UIColor greenColor];
    }
    return _sideView;
}

- (UITableView *)secondTableView {
    if (!_secondTableView) {
        _secondTableView = [UITableView newAutoLayoutView];
        _secondTableView.backgroundColor = JCRedColor;
    }
    return _secondTableView;
}

- (void) showSideView:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.leftConstraints.constant = sender.selected ? JCWindowWidth-100 : 0;
    [self.secondTableView autoSetDimension:ALDimensionWidth toSize:JCWindowWidth];
//    [UIView animateWithDuration:2 animations:^{
//    }];
    
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
