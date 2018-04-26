//
//  NSDataMD5Tests.m
//  SLToolsTests
//
//  Created by kentjia on 2018/4/26.
//  Copyright © 2018 jkstyle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSData+MD5.h"


@interface NSDataMD5Tests : XCTestCase

@end

@implementation NSDataMD5Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *emptyDataMD5String = [[[NSData alloc] init] MD5String];
    XCTAssert([emptyDataMD5String isEqualToString:@"d41d8cd98f00b204e9800998ecf8427e"]);
    
    NSData *data = [@"hello, world!" dataUsingEncoding:NSUTF8StringEncoding];
    NSString *dataMD5String = [data MD5String];
    XCTAssert([dataMD5String isEqualToString:@"3adbbad1791fbae3ec908894c4963870"]);
}

@end
