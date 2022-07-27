//
//  UINavigationController+Theme.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit

public enum NavigationBarStyle: Equatable {
    //白色背景，黑色字体
    case white
    // 自定义
    case custom(_ bgColor: UIColor, tintColor: UIColor)
    //透明背景，白色字体
    case clear
    //自定义导航背景图片，默认黑色字体
    case theme(_ image: UIImage,tintColor: UIColor?)
}

public extension UINavigationController {
    
    var barBackgroudView: UIView? {
        let barBackground = navigationBar.subviews.first
        return barBackground
    }
    var barStyle: NavigationBarStyle {
        set {
            objc_setAssociatedObject(self, &kBarStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            let style = objc_getAssociatedObject(self, &kBarStyle) as? NavigationBarStyle
            return style ?? .white
        }
    }
    
    func barTintStyle(_ style: NavigationBarStyle = .white) {
        
        barStyle = style
        navigationBar.isTranslucent = false
        
        switch style {
            
        case .white:
            /*
            if #available(iOS 15, *) {
                let bar = UINavigationBarAppearance()
                bar.configureWithDefaultBackground()
                bar.backgroundColor = .white
                bar.shadowColor = .clear
                bar.titleTextAttributes = [.foregroundColor: UIColor.hexString("#2F302E"), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = bar
                navigationBar.standardAppearance = bar
                
            }else
            */
            if #available(iOS 13.0, *) {
                navigationBar.standardAppearance.configureWithDefaultBackground()
                navigationBar.standardAppearance.backgroundColor = .white
                navigationBar.standardAppearance.shadowColor = UIColor.clear
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
                
            }else {
                navigationBar.setBackgroundImage(nil, for: .default)
                navigationBar.shadowImage = self.image(color: UIColor.groupTableViewBackground)
                navigationBar.barTintColor = .white
                navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                
            }
            
            navigationBar.tintColor = UIColor.black
            
        case .custom(let bgColor, let tintColor):
            
            if #available(iOS 13.0, *) {
                navigationBar.standardAppearance.configureWithDefaultBackground()
                navigationBar.standardAppearance.backgroundColor = bgColor
                navigationBar.standardAppearance.shadowColor = UIColor.clear
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: tintColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
                
            }else {
                navigationBar.setBackgroundImage(nil, for: .default)
                navigationBar.shadowImage = self.image(color: UIColor.clear)
                navigationBar.barTintColor = bgColor
                navigationBar.titleTextAttributes = [.foregroundColor: tintColor,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                
            }
            
            navigationBar.tintColor = tintColor
            
        case .clear:
            /*
            if #available(iOS 15, *) {
                let bar = UINavigationBarAppearance()
                bar.configureWithTransparentBackground()
                bar.backgroundColor = .clear
                bar.shadowColor = .clear
                bar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = bar
                navigationBar.standardAppearance = bar
                
            } else
            */
            if #available(iOS 13.0, *) {
                navigationBar.standardAppearance.configureWithTransparentBackground()
                navigationBar.standardAppearance.backgroundColor = .clear
                navigationBar.standardAppearance.shadowColor = .clear
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
                
            }else {
                navigationBar.barTintColor = nil
                navigationBar.setBackgroundImage(UIImage.init(), for: .compact)
                navigationBar.shadowImage = self.image(color: UIColor.clear)
                navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                
            }
//            navigationBar.isTranslucent = true
            navigationBar.tintColor = UIColor.white
            
            
        case .theme(let img, let tintColor):
            let _tintColor = tintColor ?? .black
            
            if #available(iOS 13.0, *) {
                navigationBar.standardAppearance.configureWithOpaqueBackground()
                navigationBar.standardAppearance.backgroundImage = img
                navigationBar.standardAppearance.shadowColor = .clear
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: _tintColor,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            }else {
                navigationBar.barStyle = .black
                navigationBar.setBackgroundImage(img, for: .default)
                navigationBar.shadowImage = self.image(color: UIColor.clear)
                navigationBar.titleTextAttributes = [.foregroundColor: _tintColor,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
                
            }
            
            navigationBar.tintColor = _tintColor
            
        }
        
        configBarTextAttributes(style)
        
    }
    
    // 适配iOS13一下导航标题字体颜色问题
    private func configBarTextAttributes(_ style: NavigationBarStyle) {
        if #available(iOS 13.0, *) {} else {
            //style == .white ? UIColor.black : UIColor.white
            let textColor = navigationBar.tintColor
            
            for barView in navigationBar.subviews {
                if let navBarContentView = NSClassFromString("_UINavigationBarContentView"),  barView.isKind(of: navBarContentView) {
                    for subView in barView.subviews {
                        if subView.isKind(of: UILabel.self) {
                            (subView as? UILabel)?.textColor = textColor
                        }
                    }
                    
                }
            }
            
        }
        
        
    }
    
    //根据颜色生成图片
    private func image(color: UIColor, rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
// end
}


private var kBarStyle:UInt8 = 0
