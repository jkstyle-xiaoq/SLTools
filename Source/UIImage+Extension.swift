//
//  UIImage+Extension.swift
//  SLTools
//
//  Created by kentjia on 2018/5/25.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit
import CoreGraphics


// 创建一个纯色的图片，颜色为color，大小为size
extension UIImage {
    
    @objc public class func sl_image(withSize size: CGSize, color: UIColor) -> UIImage? {
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
}

// 创建边框图片
extension UIImage {
    
    @objc public class func sl_image(withSize size: CGSize, fillColor: UIColor, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) -> UIImage? {
    
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        var rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        rect = rect.insetBy(dx: borderWidth/2.0, dy: borderWidth/2.0)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        fillColor.setFill()
        path.fill()
        
        path.lineWidth = borderWidth;
        borderColor.setStroke()
        path.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

// 选取图片某个点的颜色
extension UIImage {
    @objc public func sl_color(atPoint point: CGPoint) -> UIColor? {
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

// 截取图片
extension UIImage {
    
    @objc public func sl_crop(toRect rect: CGRect) -> UIImage? {
        let cropRect = CGRect(x: rect.minX * self.scale, y: rect.minY * self.scale, width: rect.width * self.scale, height: rect.height * self.scale)
        if let cgImage = self.cgImage?.cropping(to: cropRect) {
            return UIImage(cgImage: cgImage)
        }
        return nil;
    }
}

// render
extension UIImage {
    // use tintColor to render the image
    @objc public func sl_tint(tintColor: UIColor, mode: CGBlendMode = .darken) -> UIImage {
        
        return modifiedImage { context, rect in
            // draw black background - workaround to preserve color of partially transparent pixels
            context.setBlendMode(.normal)
            UIColor.black.setFill()
            context.fill(rect)
            
            // draw original image
            context.setBlendMode(.normal)
            context.draw(self.cgImage!, in: rect)
            
            // tint image (loosing alpha) - the luminosity of the original image is preserved
            context.setBlendMode(mode)
            tintColor.setFill()
            context.fill(rect)
            
            // mask by alpha values of original image
            context.setBlendMode(.destinationIn)
            context.draw(self.cgImage!, in: rect)
        }
    }
    
    // fills the alpha channel of the source image with the given color
    // any color information except to the alpha channel will be ignored
    @objc public func fillAlpha(fillColor: UIColor) -> UIImage {
        
        return modifiedImage { context, rect in
            // draw tint color
            context.setBlendMode(.normal)
            fillColor.setFill()
            context.fill(rect)
            
            // mask by alpha values of original image
            context.setBlendMode(.destinationIn)
            context.draw(self.cgImage!, in: rect)
        }
    }
    
    fileprivate func modifiedImage(_ draw: (CGContext, CGRect) -> ()) -> UIImage {
        
        // using scale correctly preserves retina images
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context: CGContext! = UIGraphicsGetCurrentContext()
        assert(context != nil)
        
        // correctly rotate image
        context.translateBy(x: 0, y: size.height);
        context.scaleBy(x: 1.0, y: -1.0);
        
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        draw(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

