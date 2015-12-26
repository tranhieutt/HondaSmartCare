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

typedef NS_ENUM(NSInteger, HondaFailureCode)
{
    kHondaSuccess = 0,
    kHondaErrorTrendWayGoExist = 12,
    kHondaErrorTrendWayBackExist = 22,
    kHondaErrorTrendWayGoFull = 11,
    kHondaErrorTrendWayBackFull = 21,
    
    kHondaFailureNetwork = 97,
    kHondaFailureTimeOut = 98,
    kHondaFailureUnknowError = 99
};