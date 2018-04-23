//
//  UIColorCreationTests.swift
//  SLToolsTests
//
//  Created by kentjia on 2018/4/23.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import XCTest
@testable import SLTools


class UIColorCreationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRGBAValue() {
        var color = UIColor(RGBAValue: 0x12345678)
        self.assertColorValue(color: color, r: 0x12, g: 0x34, b: 0x56, a: 0x78)
        
        color = UIColor(RGBAValue: 0x1234567)
        self.assertColorValue(color: color, r: 0x1, g: 0x23, b: 0x45, a: 0x67)
        
        color = UIColor(RGBAValue: 0x67)
        self.assertColorValue(color: color, r: 0, g: 0, b: 0, a: 0x67)
    }
    
    func testRGBValueAndAlphaValue() {
        let color = UIColor(RGBValue: 0x123456, alpha: 0.8)
        self.assertColorValue(color: color, r: 0x12, g: 0x34, b: 0x56, a: Int(0.8*255.0))
    }
    
    func testRGBAString() {
        // prefix with "0x"
        var color = UIColor(RGBAString: "0xAACCDDEE")
        self.assertColorValue(color: color, r: 0xAA, g: 0xCC, b: 0xDD, a: 0xEE)
        
        color = UIColor(RGBAString: "0x1234567")
        self.assertColorValue(color: color, r: 0x1, g: 0x23, b: 0x45, a: 0x67)
        
        color = UIColor(RGBAString: "0x78")
        self.assertColorValue(color: color, r: 0, g: 0, b: 0, a: 0x78)
        
        // none prefix
        color = UIColor(RGBAString: "ABBBDDEE")
        self.assertColorValue(color: color, r: 0xAB, g: 0xBB, b: 0xDD, a: 0xEE)
        
        color = UIColor(RGBAString: "1234567")
        self.assertColorValue(color: color, r: 0x1, g: 0x23, b: 0x45, a: 0x67)
        
        // prefix with "#"
        color = UIColor(RGBAString: "#ABBBDDEE")
        self.assertColorValue(color: color, r: 0xAB, g: 0xBB, b: 0xDD, a: 0xEE)
        
        color = UIColor(RGBAString: "#34567")
        self.assertColorValue(color: color, r: 0, g: 0x3, b: 0x45, a: 0x67)
        
        // empty string（clear color）
        color = UIColor(RGBAString: "")
        self.assertColorValue(color: color, r: 0, g: 0, b: 0, a: 0)
        
        // overflow（clear color）
        color = UIColor(RGBAString: "12AABBCCDD")
        self.assertColorValue(color: color, r: 0, g: 0, b: 0, a: 0)
        
        // invalid character（clear color）
        color = UIColor(RGBAString: "AABBCCSS")
        self.assertColorValue(color: color, r: 0, g: 0, b: 0, a: 0)
    }
    
    private func assertColorValue(color: UIColor, r: Int, g: Int, b: Int, a: Int) {
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        var alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssert(Int(red*255.0) == r &&
            Int(green*255.0) == g &&
            Int(blue*255.0) == b &&
            Int(alpha*255.0) == a)
    }
}
