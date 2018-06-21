//
//  NetworkViewController.m
//  jichang
//
//  Created by jiamanu on 2018/6/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)requestDataOfGetWithUrl:(NSString *)url parameter:(NSDictionary *)param successBlock:(void (^)(id))successBlock failedBlock:(void (^)(NSError *))failedBlock {
    
    [self showSuitHint:@"请耐心等待"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = AFHTTPRequestSerializer.serializer;
    manager.responseSerializer = AFHTTPResponseSerializer.serializer;
    
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    [manager GET:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self hideHud];
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)requestDataOfPostWithUrl:(NSString *)url parameter:(NSDictionary *)param successBlock:(void (^)(id))successBlock failedBlock:(void (^)(NSError *))failedBlock {
    
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
