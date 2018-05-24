//
//  UIImage+Color.swift
//  SLTools
//
//  Created by kentjia on 2018/5/13.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage {
    
    class func sl_image(withColor color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            
            let rect = CGRect(origin: CGPoint(), size: size)
            context.fill(rect)
            
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        
        return nil
    }
    
    func sl_color(atPoint point: CGPoint) -> UIColor? {
        let scale = self.scale
        let imageWidth = Int(round(self.size.width * scale))
        let imageHeight = Int(round(self.size.height * scale))
        let pointX = Int(round(point.x * scale))
        let pointY = Int(round(point.y * scale))
        if pointX >= 0 && pointX < imageWidth &&
            pointY >= 0 && pointY < imageHeight {
            
            let bitsPerConponent = 8
            let bytesPerPixel = 4
            let bytesPerRow = bytesPerPixel * imageWidth
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue +  CGBitmapInfo.byteOrder32Big.rawValue
            let context = CGContext(data: nil, width: imageWidth, height: imageHeight, bitsPerComponent: bitsPerConponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
            if let context = context, let cgImage = self.cgImage {
                let drawRect = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
                context.draw(cgImage, in: drawRect)
                
                if let rawPointer = context.data {
                    let buffer = UnsafeMutableRawBufferPointer(start: rawPointer, count: bytesPerRow * imageHeight)
                    let offset = pointY * bytesPerRow + pointX * bytesPerPixel
                    let red = CGFloat(buffer[offset]) / 255.0
                    let green = CGFloat(buffer[offset + 1]) / 255.0
                    let blue = CGFloat(buffer[offset + 2]) / 255.0
                    let alpha = CGFloat(buffer[offset + 3]) / 255.0
                    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
                }
            }
        }
        
        return nil
    }
}
