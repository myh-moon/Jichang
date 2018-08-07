//
//  SixViewController.m
//  jichang
//
//  Created by jiamanu on 2018/7/31.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "SixViewController.h"

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface SixViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *sixPageViewController;
@property (nonatomic,strong) NSMutableArray *list;
@property (nonatomic,assign) NSInteger pageCount;

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"page";
    
    [self addChildViewController:self.sixPageViewController];
    
    [self.view addSubview:self.sixPageViewController.view];
    
    [self.view setNeedsUpdateConstraints];
}

//- (void)updateViewConstraints {
//    if (!self.didSetupConstraints) {
//        self.didSetupConstraints = YES;
//    }
//    [super updateViewConstraints];
//}

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray arrayWithObjects:[[SecondViewController alloc] init],[[ThirdViewController alloc] init],[[FourViewController alloc] init], nil];
    }
    return _list;
}

- (UIPageViewController *)sixPageViewController {
    if (!_sixPageViewController) {
        _sixPageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _sixPageViewController.view.frame = CGRectMake(0, 0, JCWindowWidth, JCWindowHeight);
        _sixPageViewController.delegate = self;
        _sixPageViewController.dataSource = self;
        [_sixPageViewController setViewControllers:@[self.list[_pageCount]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        
    }
    return _sixPageViewController;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    return nil;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return nil;
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
