//
//  UIFont+Attributes.swift
//  SLTools
//
//  Created by kentjia on 2018/5/24.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UIFont {
    private var sl_weight: CGFloat {
        if let traits = fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any],
            let weight = traits[.weight] as? CGFloat {
            return weight
        } else {
            return 0
        }
    }
    
    @objc public var sl_isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    // [UltraLight, Thin, Light]
    @objc public var sl_isLight: Bool {
        if #available(iOS 8.2, *) {
            return sl_weight < UIFont.Weight.regular.rawValue
        } else {
            return sl_weight <= -0.4
        }
    }
    
    // (Light, Regular, Medium)
    @objc public var sl_isRegular: Bool {
        if #available(iOS 8.2, *) {
            return UIFont.Weight.regular.rawValue <= sl_weight && sl_weight < UIFont.Weight.medium.rawValue - 0.1
        } else {
            return -0.4 < sl_weight && sl_weight < 0.2
        }
    }
    
    // [Medium, Semibold]
    // WORKAROUND:
    // Rubik-Medium's weight is 0.2 which is smaller than system medium font weight 0.23, that will be replaced by Rubik-Regular on next display pass.
    // Thus give medium a wider range to accommendate Rubik's weight
    @objc public var sl_isMedium: Bool {
        if #available(iOS 8.2, *) {
            return UIFont.Weight.medium.rawValue - 0.1 <= sl_weight && sl_weight <= UIFont.Weight.semibold.rawValue
        } else {
            return 0.2 <= sl_weight && sl_weight <= 0.4
        }
    }
    
    // (Semibold, bold, heavy)
    @objc public var sl_isBold: Bool {
        let bold = fontDescriptor.symbolicTraits.contains(.traitBold)
        if bold {
            return true
        } else {
            if #available(iOS 8.2, *) {
                return UIFont.Weight.semibold.rawValue < sl_weight && sl_weight < UIFont.Weight.heavy.rawValue
            } else {
                return 0.4 < sl_weight && sl_weight < 0.8
            }
        }
    }
    
    // [Heavy, Black]
    @objc public var sl_isBlack: Bool {
        if #available(iOS 8.2, *) {
            return UIFont.Weight.heavy.rawValue <= sl_weight/* && weight <= UIFontWeightBlack */
        } else {
            return 0.8 <= sl_weight/* && weight <= 1 */
        }
    }
}
