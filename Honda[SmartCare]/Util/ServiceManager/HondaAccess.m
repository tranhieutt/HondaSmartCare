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
        [manager.requestSerializer setValue:@"K11yFOWz1ShVrRzEXw2x0iadbhaDrPuA8zQnKtHq" forHTTPHeaderField:@"X-Parse-Application-Id"];
        [manager.requestSerializer setValue:@"zWaJkFQiw2eCKJL1eOHQdsKhgfgui7UGnZybFDv6" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        [manager GET:@"https://api.parse.com/1/classes/testObject" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
//        // Hardcode param
//        NSDictionary *param = @{@"Mobile" : [HelperMethods getUserID],
//                                @"" : bookingCode};
//        NSString *url = [NSString stringWithFormat:apiURL,kAPIBookingChuaThanhToan];
//        
//        AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
//        manage.responseSerializer = [AFHTTPResponseSerializer serializer];
//        //        manage.requestSerializer = [AFHTTPRequestSerializer serializer];
//        //        [manage.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        [manage POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                                         options:NSJSONReadingMutableContainers
//                                                                           error:NULL];
//            NSArray *rarray = [self convertTicketArrayWithDictionary:jsonResponse withType:DSVNTicketType_MyPurchaseTicket];
//            if (completion) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    completion(rarray);
//                });
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            if (failure) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    failure(kDSVNFailureNetwork);
//                });
//            }
//        }];
//    });
    });
}
                   
@end
