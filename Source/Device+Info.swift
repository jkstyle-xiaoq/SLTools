//
//  Device+Info.swift
//  SLTools
//
//  Created by kentjia on 2018/5/8.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

extension UIDevice {
    
    // iPhone5,1 iPad2,1 ...
    func modelName() -> String {
        var un = utsname()
        uname(&un)
        let machineMirror = Mirror(reflecting: un.machine)
        let modelName = machineMirror.children.reduce("") { (composition, element) -> String in
            guard let value = element.value as? Int8, value != 0 else {
                return composition
            }
            return composition + String(UnicodeScalar(UInt8(value)))
        }
        return modelName
    }
}
