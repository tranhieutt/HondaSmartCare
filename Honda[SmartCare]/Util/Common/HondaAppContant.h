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
static NSString * const kFormatUTC =  @"yyyy-MM-dd HH:mm:ss Z";
static NSString * const kFormatDateDisplay = @"dd/MM/yyyy";
static NSString * const MSG_BLANK = @"";
// Detect device
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 667)
#define IS_IPHONE5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 568)
#define IS_IPHONE4 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 480)
#define IS_IPHONE6PLUS ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 736)


// Camera and Photo Album's permission
#define MSG_DOES_NOT_HAVE_ACCESS_CAMERA NSLocalizedString(@"MSG_DOES_NOT_HAVE_ACCESS_CAMERA", @"This app does not have access to your camera. You can enable access in Privacy Settings.")
#define MSG_CAN_OPEN_SETING NSLocalizedString(@"MSG_CAN_OPEN_SETING", @"It looks like your privacy settings are preventing us from accessing your camera. You can fix this by doing the following:\n\n1. Touch the Go button below to open the Settings app.\n\n2. Touch Privacy.\n\n3. Turn the Camera on.\n\n4. Open this app and try again.")
#define MSG_CAN_NOT_OPEN_SETING NSLocalizedString(@"MSG_CAN_NOT_OPEN_SETING", @"It looks like your privacy settings are preventing us from accessing your camera. You can fix this by doing the following:\n\n1. Close this app.\n\n2. Open the Settings app.\n\n3. Scroll to the bottom and select this app in the list.\n\n4. Touch Privacy.\n\n5. Turn the Camera on.\n\n6. Open this app and try again.")
#define BUTTON_GO NSLocalizedString(@"BUTTON_GO", @"Go")
#define BUTTON_OK NSLocalizedString(@"BUTTON_OK", @"OK")

#define MSG_WARNING_CAN_NOT_PREVIEW NSLocalizedString(@"MSG_WARNING_CAN_NOT_PREVIEW", @"Document size is too large. It may not to preview.")
#define TITLE_STORAGE_USED NSLocalizedString(@"TITLE_STORAGE_USED", @"Storage Used")
#define TITLE_STORAGE_REMAINING NSLocalizedString(@"TITLE_STORAGE_REMAINING", @"Storage Remaining")
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