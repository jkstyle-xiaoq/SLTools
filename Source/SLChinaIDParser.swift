//
//  SLChinaIDParser.swift
//  SLTools
//
//  Created by kentjia on 2018/5/25.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit


@objc public enum ChinaIDCardGeneration: Int {
    case unknown
    case first
    case second
}

@objc public enum ChinaIDCardSex: Int {
    case unknown
    case male
    case female
}

@objc public enum ChinaIDProvinceType: Int {
    case unknown = 0
    case beijing = 11
    case tianjin = 12
    case hebei = 13
    case shanxi = 14 // 山西
    case neimenggu = 15
    case liaoning = 21
    case jilin = 22
    case heilongjiang = 23
    case shanghai = 31
    case jiangsu = 32
    case zhejiang = 33
    case anhui = 34
    case fujian = 35
    case jiangxi = 36
    case shandong = 37
    case henan = 41
    case hubei = 42
    case hunan = 43
    case guangdong = 44
    case guangxi = 45
    case hainan = 46
    case chongqing = 50
    case sichuan = 51
    case guizhou = 52
    case yunnan = 53
    case xizang = 54
    case shaanxi = 61
    case gansu = 62
    case qinghai = 63
    case ningxia = 64
    case xinjiang = 65
    case taiwan = 71
    case xianggang = 81
    case aomen = 82
    case guowai = 91
}

public class SLChinaIDParser: NSObject {

    public private(set) var ChinaIDString: String
    
    public private(set) var validIDString = false
    
    public private(set) var generation = ChinaIDCardGeneration.unknown
    
    public private(set) var provinceCode = 0
    public private(set) var provinceType = ChinaIDProvinceType.unknown
    public private(set) var provinceZhName = ""
    public private(set) var secondAreaCode = 0
    public private(set) var thirdAreaCode = 0
    public private(set) var birthday: Date? = nil
    public private(set) var birthOrder = 0
    public private(set) var sex = ChinaIDCardSex.unknown
    
    private var areaCodeNames = [ChinaIDProvinceType: String]()
    private var R = [Int]()
    private var checker = [Character]()
    
    @objc public init(ChinaIDString: String) {
        self.ChinaIDString = ChinaIDString
        super.init()
        self.setUp()
        _ = self.parse(ChinaIDString: ChinaIDString)
    }
    
    @objc public func parse(ChinaIDString: String) -> Bool {
        self.ChinaIDString = ChinaIDString
        self.reset()
        self.doParseIDString(IDString: ChinaIDString)
        return self.validIDString
    }
    
    private func reset() {
        self.validIDString = false
        self.generation = .unknown
        self.provinceCode = 0
        self.provinceType = .unknown
        self.provinceZhName = ""
        self.secondAreaCode = 0
        self.thirdAreaCode = 0
        self.birthday = nil
        self.birthOrder = 0
        self.sex = .unknown
    }
    
    private func doParseIDString(IDString: String) {
        let trimmedString = IDString .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let upperCaseString = trimmedString.uppercased()
        
        // 检验位数，支持15位1代身份证和18位二代身份证
        let utf8Count = upperCaseString.utf8.count
        if utf8Count == 15 || utf8Count == 18 {
            // 身份证类型
            self.generation = (utf8Count == 15) ? .first : .second
            
            // 校验省份/直辖市代码
            let provinceIndex = upperCaseString.index(upperCaseString.startIndex, offsetBy: 2)
            let secondAreaIndex = upperCaseString.index(provinceIndex, offsetBy: 2)
            let thirdAreaIndex = upperCaseString.index(secondAreaIndex, offsetBy: 2)
            let provinceString = String(upperCaseString[..<provinceIndex])
            let secondAreaString = String(upperCaseString[provinceIndex..<secondAreaIndex])
            let thirdAreaString = String(upperCaseString[secondAreaIndex..<thirdAreaIndex])
            if let provinceCode = Int(provinceString),
                let provinceType = ChinaIDProvinceType(rawValue: provinceCode),
                let provinceName = self.areaCodeNames[provinceType],
                let secondAreaCode = Int(secondAreaString),
                let thirdAreaCode = Int(thirdAreaString) {
                
                self.provinceCode = provinceCode
                self.provinceType = provinceType
                self.provinceZhName = provinceName
                self.secondAreaCode = secondAreaCode
                self.thirdAreaCode = thirdAreaCode
                
                // 生日
                let birthdayStartIndex = upperCaseString.index(provinceIndex, offsetBy: 4)
                var birthdayEndIndex = birthdayStartIndex
                var birthdayString = ""
                if utf8Count == 15 {
                    birthdayEndIndex = upperCaseString.index(birthdayStartIndex, offsetBy: 6)
                    birthdayString = String(upperCaseString[birthdayStartIndex..<birthdayEndIndex])
                    birthdayString = "19" + birthdayString
                } else {
                    birthdayEndIndex = upperCaseString.index(birthdayStartIndex, offsetBy: 8)
                    birthdayString = String(upperCaseString[birthdayStartIndex..<birthdayEndIndex])
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyyMMdd"
                if let birthday = dateFormatter.date(from: birthdayString) {
                    self.birthday = birthday
                    
                    // 性别
                    let orderIndex = upperCaseString.index(birthdayEndIndex, offsetBy: 3)
                    let orderString = String(upperCaseString[birthdayEndIndex..<orderIndex])
                    if let order = Int(orderString) {
                        self.birthOrder = order
                        self.sex = order % 2 == 0 ? .female : .male
                    }
                    
                    // 18位身份证，校验最末的校验码
                    if utf8Count == 18 {
                        var sum = 0
                        for (index, utf8Value) in IDString.utf8.enumerated() {
                            if index != utf8Count - 1 {
                                sum += (Int(utf8Value) - 48) * self.R[index]
                            }
                        }
                        
                        if self.checker[ sum % 11 ] == upperCaseString.last {
                            self.validIDString = true
                        }
                    } else {
                        self.validIDString = true
                    }
                }
            }
        }
        
        if (!self.validIDString) {
            self.reset()
        }
    }
    
    private func setUp() {
        self.areaCodeNames =
            [.beijing : "北京",
             .tianjin : "天津",
             .hebei : "河北",
             .shanxi : "山西",
             .neimenggu : "内蒙古",
             .liaoning : "辽宁",
             .jilin : "吉林",
             .heilongjiang : "黑龙江",
             .shanghai : "上海",
             .jiangsu : "江苏",
             .zhejiang : "浙江",
             .anhui : "安徽",
             .fujian : "福建",
             .jiangxi : "江西",
             .shandong : "山东",
             .henan : "河南",
             .hubei : "湖北",
             .hunan : "湖南",
             .guangdong : "广东",
             .guangxi : "广西",
             .hainan : "海南",
             .chongqing : "重庆",
             .sichuan : "四川",
             .guizhou : "贵州",
             .yunnan : "云南",
             .xizang : "西藏",
             .shaanxi : "陕西",
             .gansu : "甘肃",
             .qinghai : "青海",
             .ningxia : "宁夏",
             .xinjiang : "新疆",
             .taiwan : "台湾",
             .xianggang : "香港",
             .aomen : "澳门",
             .guowai : "国外"
        ]
        
        self.R = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
        
        self.checker = ["1","0","X", "9", "8", "7", "6", "5", "4", "3", "2"]
    }
}
