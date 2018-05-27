//
//  StringMD5Tests.m
//  SLToolsTests
//
//  Created by kentjia on 2018/4/26.
//  Copyright © 2018 jkstyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MD5.h"


@interface StringMD5Tests : XCTestCase

@end

@implementation StringMD5Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringMD5 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *emptyStringMD5 = [@"" MD5String];
    XCTAssert([emptyStringMD5 isEqualToString:@"d41d8cd98f00b204e9800998ecf8427e"]);
    
    NSString *str1 = [@"hello, world!" MD5String];
    XCTAssert([str1 isEqualToString:@"3adbbad1791fbae3ec908894c4963870"]);
}

@end
