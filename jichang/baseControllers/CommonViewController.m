//
//  CommonViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *commonManager;
@property (nonatomic,strong) UITableView *commonTableView;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.commonTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.commonManager = [[RETableViewManager alloc] initWithTableView:self.commonTableView];
    
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
                
        [self.commonTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)commonTableView {
    if (!_commonTableView) {
        _commonTableView = [UITableView newAutoLayoutView];
        _commonTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, JCSmallSpace)];
    }
    return _commonTableView;
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
