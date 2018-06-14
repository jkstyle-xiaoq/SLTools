//
//  CGRect+Extension.swift
//  Examples
//
//  Created by kentjia on 2018/6/14.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension CGRect {

    public init(startPoint: CGPoint, endPoint: CGPoint) {
        let x = min(startPoint.x, endPoint.x)
        let y = min(startPoint.y, endPoint.y)
        let width = fabs(startPoint.x - endPoint.x)
        let height = fabs(startPoint.y - endPoint.y)
        self.init(x: x, y: y, width: width, height: height)
    }
}
