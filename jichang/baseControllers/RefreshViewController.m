//
//  RefreshViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *refreshManager;
@property (nonatomic,strong) UITableView *refreshTableView;

@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.refreshTableView];
    [self.view setNeedsUpdateConstraints];
    
    self.refreshManager = [[RETableViewManager alloc] initWithTableView:self.refreshTableView];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
    
        [self.refreshTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)refreshTableView {
    if (!_refreshTableView) {
        _refreshTableView = [UITableView newAutoLayoutView];
        _refreshTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, JCSmallSpace)];
    }
    return _refreshTableView;
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
