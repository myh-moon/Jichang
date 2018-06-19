//
//  BaseViewController.h
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


@property (nonatomic,assign) BOOL didSetupConstraingts;

@property (nonatomic,strong) UIBarButtonItem *backButton;
@property (nonatomic,strong) UIButton *rightButton;

@end
