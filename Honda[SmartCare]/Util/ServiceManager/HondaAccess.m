//
//  HondaAccess.m
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/26/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#import "HondaAccess.h"

@implementation HondaAccess
// Create Singleton: https://developer.apple.com/library/ios/documentation/general/conceptual/DevPedia-CocoaCore/Singleton.html
+ (HondaAccess *)sharedInstance {
    static dispatch_once_t onceToken;
    static HondaAccess *sharedInstance = nil;
    // make sure it run only one.
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[HondaAccess alloc] init];
        }
    });
    return sharedInstance;
}
/**
 getAccessaryById: Lấy thông tin phụ tùng của xe theo Id
 */
- (void)getAccessaryById:(NSString *)accessaryId withCompletion:(void(^)(NSArray *resultArray))completion failure:(void(^)(HondaFailureCode failureCode))failure {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer setValue:kParseApplicationId forHTTPHeaderField:xParseApplicationId];
        [manager.requestSerializer setValue:kParseREST_APIKey forHTTPHeaderField:xParseREST_APIKey];
        [manager GET:@"https://api.parse.com/1/classes/testObject" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                         options:NSJSONReadingMutableContainers
                                                                           error:NULL];
            NSArray *rarray; //= [self convertBookingArrayWithDictionary:jsonResponse];
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(rarray);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(kHondaFailureNetwork);
                });
            }
        }];
    });
}
/**
 getAccessaryById: Lấy thông tin theo nhóm phụ tùng
 */
- (void)getListAccessaryByGroupId:(NSString *)groupId withCompletion:(void(^)(NSArray *resultArray))completion failure:(void(^)(HondaFailureCode failureCode))failure {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer setValue:kParseApplicationId forHTTPHeaderField:xParseApplicationId];
        [manager.requestSerializer setValue:kParseREST_APIKey forHTTPHeaderField:xParseREST_APIKey];
        [manager GET:[NSString stringWithFormat:kParseGET_REST_API_Classe,groupId] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                         options:NSJSONReadingMutableContainers
                                                                           error:NULL];
            NSArray *rarray;
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(rarray);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(kHondaFailureNetwork);
                });
            }
        }];
    });
}
@end
