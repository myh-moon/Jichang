//
//  ThirdViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic,strong) UIButton *blueButton;
@property (nonatomic,strong) UIButton *redButton;
@property (nonatomic,strong) UIButton *greenButton;
@property (nonatomic,strong) UIButton *grayButton;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"横向";
    
    [self.view addSubview:self.blueButton];
    [self.view addSubview:self.redButton];
    [self.view addSubview:self.greenButton];
    [self.view addSubview:self.grayButton];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.blueButton,self.redButton,self.greenButton,self.grayButton];
        [views autoMatchViewsDimension:ALDimensionWidth];
        
        [views autoMatchViewsDimension:ALDimensionHeight];
        [[views firstObject] autoSetDimension:ALDimensionHeight toSize:60];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:90];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        UIView *previousView = nil;
        
        for (UIView *view in views) {
            if (previousView) {
                [view autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:previousView];
                [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:previousView];
            }
            previousView = view;
        }
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIButton *)blueButton {
    if (!_blueButton) {
        _blueButton = [UIButton newAutoLayoutView];
        _blueButton.backgroundColor = [UIColor blueColor];
    }
    return _blueButton;
}
- (UIButton *)redButton {
    if (!_redButton) {
        _redButton = [UIButton newAutoLayoutView];
        _redButton.backgroundColor = [UIColor redColor];
    }
    return _redButton;
}
- (UIButton *)greenButton {
    if (!_greenButton) {
        _greenButton = [UIButton newAutoLayoutView];
        _greenButton.backgroundColor = [UIColor greenColor];
    }
    return _greenButton;
}
- (UIButton *)grayButton {
    if (!_grayButton) {
        _grayButton = [UIButton newAutoLayoutView];
        _grayButton.backgroundColor = [UIColor grayColor];
    }
    return _grayButton;
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
