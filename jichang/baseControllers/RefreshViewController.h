//
//  RefreshViewController.h
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface RefreshViewController : NetworkViewController

@property (nonatomic,strong) void (^PullToLoadHandle)(void);
@property (nonatomic,strong) void (^PullToRefreshHandle)(void);

@end
