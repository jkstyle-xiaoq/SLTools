//
//  String+Extension.swift
//  SLTools
//
//  Created by kentjia on 2018/12/8.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import Foundation


extension String {
    
    func sl_backspaceSubstrings() -> [String] {
        let substrings = self.flatMap { (character) -> [String] in
            // 证明character是由几个可以被单独删除的code points组成；
            // 或者证明character的几个code points，不仅显示作为一个整体，退格也不能分割。
            let str = String(character)
            let notDividable = str.unicodeScalars.contains { self.sl_isNotDividableUnicodeScalar(unicodeScalar: $0) }
            if (notDividable) {
                return [String(character)]
            } else {
                let strings = str.unicodeScalars.map({ (scalar) -> String in
                    return String(scalar)
                })
                return strings
            }
        }
        return substrings
    }
    
    private func sl_isNotDividableUnicodeScalar(unicodeScalar: Unicode.Scalar) -> Bool {
        switch unicodeScalar.value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0xE0100...0xE01EF, // Variation Selector Supplyments
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        0x1F018...0x1F270, // Various asian characters
        0x238C...0x2454, // Misc items
        0x20D0...0x20FF, // Combining Diacritical Marks for Symbols
        0x200D: // Zero width joiner
            return true
            
        default:
            return false
        }
    }
}
