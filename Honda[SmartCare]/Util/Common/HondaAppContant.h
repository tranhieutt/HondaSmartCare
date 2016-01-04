//
//  HondaAppContant.h
//  Honda[SmartCare]
//
//  Created by Tran Trung Hieu on 12/26/15.
//  Copyright © 2015 3SI. All rights reserved.
//

#ifndef HondaAppContant_h
#define HondaAppContant_h


#endif /* HondaAppContant_h */
static NSString * const xParseApplicationId = @"X-Parse-Application-Id";

static NSString * const kParseApplicationId = @"K11yFOWz1ShVrRzEXw2x0iadbhaDrPuA8zQnKtHq";

static NSString * const xParseREST_APIKey   = @"X-Parse-REST-API-Key";
static NSString * const kParseREST_APIKey   = @"zWaJkFQiw2eCKJL1eOHQdsKhgfgui7UGnZybFDv6";

static NSString * const kParseGET_REST_API_Classe = @"https://api.parse.com/1/classes/%@";

static NSString * const YOUR_PZ_APP_ID_NSSTRING = @"26d76d4ff6dd16038818fe3a8eef0f82";
static NSString * const YOUR_PZ_API_KEY_NSSTRING = @"e656d8e366cf178e752249af02c8c04c88e246c0";

// Detect device
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 667)
#define IS_IPHONE5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 568)
#define IS_IPHONE4 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 480)
#define IS_IPHONE6PLUS ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 736)

typedef NS_ENUM(NSInteger, HondaFailureCode)
{
    kHondaFailureNetwork = 0,
    kHondaSuccess = 1

};
typedef NS_ENUM(NSInteger, HDDateType) {
    HDFullDate,
    HDDateYYMM,
    HDDateYYMMDD,
    HDDateMMDDYYYY
};