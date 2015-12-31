// The MIT License (MIT)
//
// Copyright (c) 2015 FPT Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "MDButton.h"

// A dummy MDButtonDelegate that doesn't implement any of its @optional methods
@interface DummyMDButtonDelegate : NSObject <MDButtonDelegate>

@end

@implementation DummyMDButtonDelegate


@end

@interface MDButtonTests : XCTestCase

@end

@implementation MDButtonTests

- (void)testOptionalDelegateMethodsShouldNotCrashIfNotImplemented {
    MDButton *button = [[MDButton alloc] init];
    DummyMDButtonDelegate *delegate = [DummyMDButtonDelegate new];
    button.mdButtonDelegate = delegate;

    // Animate this block so that the animation blocks that call rotationCompleted are run.
    [UIView animateWithDuration:1.5 animations:^{
        button.rotated = YES;
    } completion:nil];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
}

@end
