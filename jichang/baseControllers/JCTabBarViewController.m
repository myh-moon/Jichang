//
//  JCTabBarViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/22.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "JCTabBarViewController.h"
#import "MainViewController.h"
#import "MineViewController.h"

@interface JCTabBarViewController ()

@end

@implementation JCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBar];
}

- (void) setupTabBar {
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.title = @"首页";
//    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页1111" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.title = @"我的";
//    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的1111" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    NSArray *arr = @[nav1,nav2];
    self.viewControllers = arr;

//    self.tabBar.tintColor = JCBlackColor;
//    self.tabBar.backgroundColor = JCWhiteColor;
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
