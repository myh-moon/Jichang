//
//  FiveViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/31.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "FiveViewController.h"
#import <QuartzCore/CADisplayLink.h>

@interface FiveViewController ()

@property (nonatomic,strong) UILabel *linkLabel;
@property (nonatomic,strong) CADisplayLink *link;

@property (nonatomic,strong) NSMutableArray *displayList;

@property (nonatomic,strong) NSLayoutConstraint *topConstraints;
@property (nonatomic,strong) NSLayoutConstraint *leftConstraints;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.linkLabel];
    
    [self.view setNeedsUpdateConstraints];

    float all = 1650*5 + 165*3 + 16.5*7;
    NSLog(@"总额%f",all);
    
    float nuan  = 53700 * 0.015;
    NSLog(@"暖心：%f",nuan);
    
    self.topConstraints =  [self.linkLabel autoPinToTopLayoutGuideOfViewController:self withInset:30];
    self.leftConstraints = [self.linkLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    
    [self startDisplayLink];
    
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {

        [self.linkLabel autoSetDimensionsToSize:CGSizeMake(200, 400)];

        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UILabel *)linkLabel {
    if (!_linkLabel) {
        _linkLabel = [UILabel newAutoLayoutView];
        _linkLabel.backgroundColor = [UIColor lightGrayColor];
        _linkLabel.numberOfLines = 0;
    }
    return _linkLabel;
}

- (void) startDisplayLink {
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveFirst)];
    self.link.paused = NO;
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//    self.link.frameInterval = 180;  //3s
    
    NSLog(@"startDisplayLink");
}

- (void) stopDisplayLink {
    [self.link invalidate];
    self.link = nil;
    NSLog(@"stopDisplayLink");
}

- (void) moveFirst {
    NSLog(@"showLink");
    
    NSString *asas = @"我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近我们的距离好像忽远又忽近";
    for (NSInteger i = 0 ;  i < asas.length; i++) {
        NSString *sdsd = [NSString stringWithFormat:@"%ld",(long)i];
        
        [self.displayList addObject:sdsd];
        
        self.linkLabel.text = sdsd;
    }
    [self stopDisplayLink];
    
//    NSMutableAttributedString *linkAttributedString = [[NSMutableAttributedString alloc] initWithString:asas];
//
//    [linkAttributedString addAttribute:NSBaselineOffsetAttributeName value:@(self.linkLabel.font.lineHeight) range:NSMakeRange(0, asas.length)];
//
//    self.linkLabel.attributedText = linkAttributedString;
    
}

- (void) moveSecond {
    self.topConstraints.constant = 340;
    self.leftConstraints.constant = 200;
    
    [self moveThird];
}

- (void) moveThird {
    self.topConstraints.constant = 30;
    self.leftConstraints.constant = 200;
    
    [self moveFourth];
}

- (void) moveFourth {
    self.topConstraints.constant = 30;
    self.leftConstraints.constant = 30;
    
    [self moveFirst];
}


- (NSMutableArray *)displayList {
    if (!_displayList) {
        _displayList = [NSMutableArray array];
    }
    return _displayList;
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
