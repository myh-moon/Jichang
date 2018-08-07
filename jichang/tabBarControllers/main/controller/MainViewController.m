//
//  MainViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainViewController.h"
#import <YBPopupMenu/YBPopupMenu.h>

#import "GestureViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"


#define kMaxScrollContentSizeY 250

#define kMinScrollContentSizeY 80

@interface MainViewController ()<YBPopupMenuDelegate,RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *mainManager;
@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) UIButton *topView;
@property (nonatomic,assign) CGFloat topHeight;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topHeight = 120;
    
    self.navigationItem.title = @"首页";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.rightBtn setTitle:@"微信" forState:0];
    
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.topView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.mainManager = [[RETableViewManager alloc] initWithTableView:self.mainTableView delegate:self];

    [self setupMainTableView];
//    [self.mainTableView reloadData];
}

- (void)rightAction {
    NSArray *array = @[@"发起群聊",@"扫一扫",@"收付款",@"添加朋友"];
    NSArray *array1 = @[@"share_black",@"share_black",@"share_black",@"share_black"];

//    YBPopupMenu show
    [YBPopupMenu showAtPoint:CGPointMake(JCWindowWidth-50, 72) titles:array icons:array1 menuWidth:125 otherSettings:^(YBPopupMenu *popupMenu) {
        popupMenu.showMaskView = NO;
        popupMenu.tableView.backgroundColor = JCRedColor;
        popupMenu.priorityDirection = YBPopupMenuPriorityDirectionTop;
    }];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.mainTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [self.topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.topView autoSetDimension:ALDimensionHeight toSize:_topHeight];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIButton *)topView {
    if (!_topView) {
        _topView = [UIButton newAutoLayoutView];
//        _topView.backgroundColor = [UIColor orangeColor];
        [_topView setBackgroundImage:[UIImage imageNamed:@"活动_01@3x"] forState:0];
    }
    return _topView;
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [UITableView newAutoLayoutView];
        _mainTableView.tableFooterView = [UIView new];
    }
    return _mainTableView;
}


- (void)setupMainTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight  = 0;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCWindowWidth, _topHeight+20)];
    headerView.backgroundColor = [UIColor blueColor];
    section.headerView = headerView;
    [self.mainManager addSection:section];
    
    for (NSInteger i=0; i<6; i++) {
        NSString *tit = [NSString stringWithFormat:@"title %ld",(long)i];
        RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:tit];
        [section addItem:item];
        
        item.selectionHandler = ^(id item) {
            if (i == 0) {
                GestureViewController *gestureVC = [[GestureViewController alloc] init];
                gestureVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:gestureVC animated:YES];
                
            }else if (i == 1){
                SecondViewController *secondVC = [[SecondViewController alloc] init];
                secondVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:secondVC animated:YES];
            }else if (i == 2){
                ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
                thirdVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:thirdVC animated:YES];
            }else if (i == 3){
                FourViewController *fourVC = [[FourViewController alloc] init];
                fourVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:fourVC animated:YES];
            }else if (i == 4){
                FiveViewController *fiveVC = [[FiveViewController alloc] init];
                fiveVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:fiveVC animated:YES];
            }
        };
    }
}

#pragma mark - scrollView delegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSet = scrollView.contentOffset.y;
    CGRect frame = self.topView.frame;
    
    if (offSet < 0) {//向下拉
        frame.size.height = (_topHeight + fabs(offSet)) < kMaxScrollContentSizeY ? (_topHeight + fabs(offSet)) : kMaxScrollContentSizeY;
        frame.origin.y = 0;
        
        if ((_topHeight + fabs(offSet)) > kMaxScrollContentSizeY ) {
            scrollView.contentOffset = CGPointMake(0, _topHeight - kMaxScrollContentSizeY);
        }
        
    }else{//向上滑
        //取消弹簧效果
//        scrollView.contentOffset = CGPointZero;
//        frame.size.height = _topHeight;
//        frame.origin.y = 0;
        
        frame.size.height = _topHeight;
        frame.origin.y = -offSet;
        
        if (offSet > _topHeight) {
            frame.size.height = 0;
        }
    }
    
    self.topView.frame = frame;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
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
