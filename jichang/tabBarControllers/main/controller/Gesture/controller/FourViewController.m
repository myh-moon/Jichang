//
//  FourViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "FourViewController.h"


@interface FourViewController ()

@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *greenView;
@property (nonatomic,strong) UIView *grayView;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.blueView];
    [self.blueView addSubview:self.redView];
    [self.redView addSubview:self.greenView];
    
    [self.greenView addSubview:self.grayView];
//    [self.view addSubview:self.greenView];
//    [self.view addSubview:self.grayView];
    
   CADisplayLink *link =  [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinked)];
    link.paused = true;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    
    if (!self.didSetupConstraints) {
        
        [self.blueView autoPinToTopLayoutGuideOfViewController:self withInset:10];
        [self.blueView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 10, 10, 10) excludingEdge:ALEdgeTop];
        
        self.blueView.layoutMargins = UIEdgeInsetsMake(10, 80, 100, 80);
        
        [self.redView autoPinEdgesToSuperviewMargins];
        self.redView.preservesSuperviewLayoutMargins = YES;
        
        [self.greenView autoPinEdgeToSuperviewMargin:ALEdgeLeft];
        [self.greenView autoPinEdgeToSuperviewMargin:ALEdgeRight];
        [self.greenView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.greenView withOffset:0.1];
//        [self.greenView autoSetDimension:ALDimensionHeight toSize:20];
        
        
        [self.grayView autoPinEdgesToSuperviewMarginsExcludingEdge:ALEdgeBottom];
        [self.grayView autoSetDimension:ALDimensionHeight toSize:40];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)blueView {
    if (!_blueView) {
        _blueView = [UIView newAutoLayoutView];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [UIView newAutoLayoutView];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UIView *)grayView {
    if (!_grayView) {
        _grayView = [UIView newAutoLayoutView];
        _grayView.backgroundColor = [UIColor grayColor];
    }
    return _grayView;
}

- (void) displayLinked {
    
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
