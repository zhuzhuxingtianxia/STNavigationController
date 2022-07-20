//
//  NSObject+ClassName.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import Foundation

extension NSObject {
    
    func ClassForString(_ className:String) -> NSObject.Type{
       
        var objc: NSObject.Type
        if NSClassFromString(className) != nil {
            objc = NSClassFromString(className) as! NSObject.Type
        }else {
            var nameSpace = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
            nameSpace = nameSpace.replacingOccurrences(of: "-", with: "_")
            let objcName:String = nameSpace + "." + className
            objc = NSClassFromString(objcName)! as! NSObject.Type
        }
        
        return objc
    }
    
    var className: String {
        let type = type(of: self)
        return String(describing: type)
    }
    
    static var className: String {
        return String(describing: Self.self)
    }
    
    
}
