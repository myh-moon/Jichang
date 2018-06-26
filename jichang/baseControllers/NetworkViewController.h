//
//  NetworkViewController.h
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseViewController.h"

@interface NetworkViewController : BaseViewController

//get
- (void) requestDataOfGetWithUrl:(NSString *)url parameter:(NSDictionary *)param successBlock:(void(^)(id respondObject))successBlock failedBlock:(void(^)(NSError *error))failedBlock;

//post
- (void) requestDataOfPostWithUrl:(NSString *)url parameter:(NSDictionary *)param successBlock:(void(^)(id respondObject))successBlock failedBlock:(void(^)(NSError *error))failedBlock;

//- (void) layoutConstraints;

@end
