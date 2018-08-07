//
//  BaseViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏字体设置
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:JCFont17,NSForegroundColorAttributeName:JCRedColor}];
    
    //去除系统效果
        self.navigationController.navigationBar.translucent = NO;
    
    //导航栏的背景颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:JCWhiteColor] forBarMetrics:UIBarMetricsDefault];

    //右滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:0];
        _leftBtn.frame = CGRectMake(0, 0, 60, 44);
        [_leftBtn setTitleColor:JCRedColor forState:0];
        [_leftBtn setTitle:@"返回" forState:0];
        _leftBtn.titleLabel.font = JCFont14;
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:0];
        _rightBtn.frame = CGRectMake(0, 0, 60, 44);
        [_rightBtn setTitleColor:JCRedColor forState:0];
        _rightBtn.titleLabel.font = JCFont14;
        [_rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (void)rightAction{
    
}

- (UIBarButtonItem *)leftBarButton {
    if (!_leftBarButton) {
//        UIButton *leftButton = [UIButton buttonWithType:0];
//        leftButton.frame = CGRectMake(0, 0, 60, 44);
//        [leftButton setTitle:@"《" forState:0];
//        [leftButton setTitleColor:JCRedColor forState:0];
//        leftButton.titleLabel.font = JCFont14;
//        _leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        _leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    return _leftBarButton;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
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
