//
//  MDTextFieldTests.m
//  iOSUILib
//
//  Created by Public on 3/4/15.
//  Copyright (c) 2015 FPT Software. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "MDTextField.h"

@interface MDTextFieldTests : XCTestCase

@end

@implementation MDTextFieldTests {
    MDTextField *textField;
}

- (void)setUp {
    [super setUp];
    textField = [[MDTextField alloc] init];
}

- (void)tearDown {
    textField = nil;
    [super tearDown];
}

- (void)testTextFieldHasLabel{
    [textField setErrorMessage:@"Có lỗi rồi nhé"];
    XCTAssertEqual(textField.errorMessage,@"Có lỗi rồi nhé", @"Pass");
}


@end
