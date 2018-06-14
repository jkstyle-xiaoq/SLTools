//
//  UIView+Positions.swift
//  SLTools
//
//  Created by kentjia on 2018/5/13.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UIView {
    
    @objc public func sl_snapshotImage(afterScreenUpdates: Bool) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: afterScreenUpdates)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @objc public func sl_setFrameX(_ x: CGFloat) -> UIView {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
        return self
    }
    
    @objc public func sl_setFrameY(_ y: CGFloat) -> UIView {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
        return self
    }
    
    @objc public func sl_setWidth(_ width: CGFloat) -> UIView {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
        return self
    }
    
    @objc public func sl_setHeight(_ height: CGFloat) -> UIView {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
        return self
    }
}
