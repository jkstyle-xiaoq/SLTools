//
//  Bundle.swift
//  SLTools
//
//  Created by kentjia on 2018/4/26.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import Foundation

extension Bundle {
    
    func shortVersion() -> String? {
        if let infoDictionary = self.infoDictionary,
           let version = infoDictionary["CFBundleShortVersionString"] as? String {
            
            return version
        }
        return nil
    }
    
    func bundleVersion() -> String? {
        if let infoDictionary = self.infoDictionary,
            let version = infoDictionary["CFBundleVersion"] as? String {
            
            return version
        }
        return nil
    }
    
    func bundleID() -> String? {
        if let infoDictionary = self.infoDictionary,
            let version = infoDictionary["CFBundleIdentifier"] as? String {
            
            return version
        }
        return nil
    }
}
