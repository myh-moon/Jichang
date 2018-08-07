//
//  CommonViewController.h
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface CommonViewController : NetworkViewController<RETableViewManagerDelegate>
@property (nonatomic,strong) RETableViewManager *commonManager;
@property (nonatomic,strong) UITableView *commonTableView;
@end
