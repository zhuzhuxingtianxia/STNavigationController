//
//  UIImage+Extention.swift
//  HFNavigationController_Example
//
//  Created by ZZJ on 2022/7/20.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    // 修改图片的透明度
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // 修改图片的颜色，并设置混合模式
    func tint(color: UIColor, blendMode: CGBlendMode = .destinationIn) -> UIImage{
        let drawRect = CGRect.init(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        //let context = UIGraphicsGetCurrentContext()
        //CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let tintedImage = tintedImage else {
            return self
        }
        return tintedImage
    }
    
    //图片圆角裁剪
    func cornerRadius(_ radius: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        //赛贝尔路径裁剪
        let path = UIBezierPath.init(roundedRect: CGRect.init(origin: .zero, size: size), cornerRadius: radius)
        path.addClip()
        draw(in: path.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        guard let _image = image else {
            return self
        }
        return _image
        
    }
    
    //根据颜色生成图片
    static func image(color: UIColor, rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
}

extension UIView {
    
    func getImage() -> UIImage? {
        //第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
        
    }
    
    
}

