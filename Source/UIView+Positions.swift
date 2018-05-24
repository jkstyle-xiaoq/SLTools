//
//  UIView+Positions.swift
//  SLTools
//
//  Created by kentjia on 2018/5/13.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UIView {
    
    func sl_setFrameX(_ x: CGFloat) -> UIView {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
        return self
    }
    
    func sl_setFrameY(_ y: CGFloat) -> UIView {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
        return self
    }
    
    func sl_setWidth(_ width: CGFloat) -> UIView {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
        return self
    }
    
    func sl_setHeight(_ height: CGFloat) -> UIView {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
        return self
    }
}
