//
//  Color+HexString.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit

extension UIColor {
    /**
     Make color with hex string
     - parameter hex: 16进制字符串
     - returns: RGB
     */
    public static func hexString (_ hex: String) -> UIColor {
        
        return UIColor.hexString(hex, alpha: 1.0)
    }
    public static func hexString (_ hex: String,alpha: CGFloat) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 1)..<cString.endIndex])
            
        }else if cString.hasPrefix("0x") {
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 1)..<cString.endIndex])
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = String(cString[cString.startIndex...cString.index(cString.startIndex, offsetBy: 1)])
        
        let gString = String(cString[cString.index(cString.startIndex, offsetBy: 2)...cString.index(cString.startIndex, offsetBy: 3)])
        
        let bString = String(cString[cString.index(cString.startIndex, offsetBy: 4)...cString.index(cString.startIndex, offsetBy: 5)])
        
        var r:UInt64 = 0, g:UInt64 = 0, b:UInt64 = 0;
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    //随机色
    public static func randColor()->UIColor {
        let r = arc4random_uniform(256)
        let g = arc4random_uniform(256)
        let b = arc4random_uniform(256)
        
        return UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
}

