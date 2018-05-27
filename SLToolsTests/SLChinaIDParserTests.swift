//
//  SLChinaIDParserTests.swift
//  SLToolsTests
//
//  Created by kentjia on 2018/5/25.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import XCTest
@testable import SLTools


class SLChinaIDParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIDNumberStringValid() {
        // 18位
        let parser = SLChinaIDParser(ChinaIDString: "370181198305104411")
        XCTAssert(parser.validIDString)
        XCTAssert(parser.generation == .second)
        XCTAssert(parser.sex == .male)
        XCTAssert(parser.provinceZhName == "山东")
        XCTAssert(parser.secondAreaCode == 01)
        XCTAssert(parser.thirdAreaCode == 81)
        XCTAssert(parser.birthOrder == 441)
        // 15位
        _ = parser.parse(ChinaIDString: "310112850409522")
        XCTAssert(parser.validIDString)
        XCTAssert(parser.generation == .first)
        XCTAssert(parser.sex == .female)
        XCTAssert(parser.provinceZhName == "上海")
        XCTAssert(parser.secondAreaCode == 01)
        XCTAssert(parser.thirdAreaCode == 12)
        XCTAssert(parser.birthOrder == 522)
        // 空
        _ = parser.parse(ChinaIDString: "")
        XCTAssert(!parser.validIDString)
        // 非15/18位
        _ = parser.parse(ChinaIDString: "37018119830510441")
        XCTAssert(!parser.validIDString)
        
        _ = parser.parse(ChinaIDString: "370181198305104411X")
        XCTAssert(!parser.validIDString)
        
        // 错误位数
        _ = parser.parse(ChinaIDString: "370181198305104415")
        XCTAssert(!parser.validIDString)
    }
    
}
