//
//  BaseViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (UIBarButtonItem *)backButton {
    if (!_backButton) {
        UIButton *backBtn = [UIButton buttonWithType:0];
        backBtn.frame = CGRectMake(0, 0, 60, 44);
        [backBtn setTitle:@"返回" forState:0];
        [backBtn setTitleColor:[UIColor redColor] forState:0];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        
        
    }
    return _backButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:0];
        _rightButton.frame = CGRectMake(0, 0, 60, 44);
        [_rightButton setTitleColor:JCRedColor forState:0];
    }
    return _rightButton;
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
