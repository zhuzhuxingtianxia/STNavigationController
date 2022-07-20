//
//  Const.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit

// MARK: - 全局常用属性
public let kScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let kScreenHeight:CGFloat = UIScreen.main.bounds.size.height
public let kStatusBarHeight: CGFloat = getStatusBarHeight()
public let kNavigationH:CGFloat = kStatusBarHeight + 44

let is_iphoneX = SafeAreaInsets.top > 20 ? true : false

//view.safeAreaInsets要在viewDidLoad之后调用才有正确的值，所以可以写一个全局常量，默认lazy属性，延时加载只赋值一次
//注意，常量只会赋值一次，竖屏调用后，转横屏，再调用值不会变
let SafeAreaInsets: UIEdgeInsets = {
    guard #available(iOS 11.0, *), let safeAreaInsets = UIApplication.shared.delegate?.window??.safeAreaInsets else {
        return UIEdgeInsets()
    }
    return safeAreaInsets
} ()

// 状态栏高度
func getStatusBarHeight() -> CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager;
        statusBarHeight = statusBarManager?.statusBarFrame.size.height ?? 20
   }
   else {
       statusBarHeight = UIApplication.shared.statusBarFrame.size.height;
   }
   return statusBarHeight;
}
