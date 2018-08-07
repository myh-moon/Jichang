//
//  GestureViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/27.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *manager;
@property (nonatomic,strong) UITableView *gesTableView;

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"gesture";
    self.view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.gesTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.gesTableView delegate:self];
    
    [self setupGesTableView];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.gesTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(JCWindowHeight-104, 0, 0, 0)];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)gesTableView {
    if (!_gesTableView) {
        _gesTableView = [UITableView newAutoLayoutView];
//        _gesTableView.tableFooterView = [UIView new];
        _gesTableView.backgroundColor = JCRedColor;
    }
    return _gesTableView;
}

- (void) setupGesTableView {
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    
    for (NSInteger i=0; i<20; i++) {
        NSString *titit = [NSString stringWithFormat:@"%ld",i];
        RETableViewItem *item  = [[RETableViewItem alloc] initWithTitle:titit];
        [section addItem:item];
    }
}

//滑动
- (void) scrollThisTableView{
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY <= 0) {
        [self.gesTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(JCWindowHeight-104)];
    }else if (offsetY > 0 && offsetY < 140) {
        [self.gesTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(JCWindowHeight-104 - offsetY)];
    }else if (offsetY >= 140){
        [self.gesTableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(JCWindowHeight-104 - 140)];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
