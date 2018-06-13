//
//  UIColor+Creation.swift
//  SLTools
//
//  Created by jkstyle on 2018/4/22.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit


extension UIColor {
    
    // 0xAABBCCFF
    @objc public convenience init(RGBAValue value: UInt32) {
        let r = CGFloat((value >> 24) & 0xFF) / 255.0
        let g = CGFloat((value >> 16) & 0xFF) / 255.0
        let b = CGFloat((value >> 8) & 0xFF) / 255.0
        let a = CGFloat((value) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // 0xAABBCC, 1.0
    @objc public convenience init(RGBValue value: UInt32, alpha: CGFloat) {
        let r = CGFloat((value >> 16) & 0xFF) / 255.0
        let g = CGFloat((value >> 8) & 0xFF) / 255.0
        let b = CGFloat((value >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    // #AABBCCFF/0xAABBCCFF/0XAABBCCFF
    // If RGBAString is greater than UInt32.max or contains invalid character, this method will construct a clear color.
    @objc public convenience init(RGBAString: String) {
        var sourceString = RGBAString.trimmingCharacters(in: CharacterSet.whitespaces)
        if sourceString.hasPrefix("#") {
            let index = sourceString.index(sourceString.startIndex, offsetBy: 1)
            sourceString = String(sourceString[index...])
        } else if sourceString.hasPrefix("0x") || sourceString.hasPrefix("0X") {
            let index = sourceString.index(sourceString.startIndex, offsetBy: 2)
            sourceString = String(sourceString[index...])
        }
        
        let validCharSet = CharacterSet(charactersIn: "0123456789ABCDEF")
        if sourceString.count <= 8 &&
            sourceString.trimmingCharacters(in: validCharSet).count == 0 {
            
            let scanner = Scanner(string: sourceString)
            
            var value = UInt32(0)
            if scanner.scanHexInt32(&value) {
                self.init(RGBAValue: value)
            } else {
                self.init(red: 0, green: 0, blue: 0, alpha: 0)
            }
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
    
    // AABBCCDD e.g.
    @objc public var hexValue: Int {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r*255) << 24 | (Int)(g*255) << 16 | (Int)(b*255) << 8 | (Int)(a*255) << 0
        return rgb
    }
    
    // "AABBCCDD" e.g.
    @objc public var hexString: String {
        let rgb = self.hexValue
        return String(rgb, radix: 16)
    }
}
