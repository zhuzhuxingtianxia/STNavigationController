//
//  STSpace.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import Foundation

public struct STSpace<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol STSpaceProtocol {}

public extension STSpaceProtocol {
    
    static var st: STSpace<Self>.Type {
        get{ STSpace<Self>.self }
        set {}
    }
    
    var st: STSpace<Self> {
        get { STSpace(self) }
        set {}
    }
}

extension UIImage: STSpaceProtocol {}

extension STSpace where Base: UIImage {
    
    static func image(named: String?) -> UIImage? {
        
        guard let named = named else { return nil }
        
        let image: UIImage?
        let frameworkBundle = Bundle(for: STNavigationController.self)
        let moduleName = String(describing: STNavigationController.self)
        if /* CocoaPods static */ let path = frameworkBundle.path(forResource: moduleName, ofType: "bundle"),let bundle = Bundle(path: path) {
            image = UIImage(named: named, in: bundle, compatibleWith: nil)
        } else if /* CocoaPods */ let bundle = Bundle.init(identifier: "org.cocoapods.\(moduleName)") {
            image = UIImage(named: "\(moduleName).bundle/\(named)", in: bundle, compatibleWith: nil)
        } else /* Manual */ {
            image = UIImage(named: named)
        }
        
        return image
        
    }
    
}
