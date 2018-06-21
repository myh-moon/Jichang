//
//  NoNavViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NoNavViewController.h"

@interface NoNavViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *noNavManager;
@property (nonatomic,strong) UITableView *noNavTableView;

@end

@implementation NoNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.noNavTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.noNavManager = [[RETableViewManager alloc] initWithTableView:self.noNavTableView];
    
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.noNavTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)noNavTableView {
    if (!_noNavTableView) {
        _noNavTableView = [UITableView newAutoLayoutView];
        _noNavTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, JCSmallSpace)];
    }
    return _noNavTableView;
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
