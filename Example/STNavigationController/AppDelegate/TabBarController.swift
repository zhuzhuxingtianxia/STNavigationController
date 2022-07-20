//
//  TabBarController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

struct TabBarConfig {
    var vcName: String?
    var vcClass: UIViewController?
    var title: String = ""
    var image: String = ""
    var selectImage: String = ""
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        // tabBar.isTranslucent = false
        
        self.delegate = self
        
        createSubControllers()
        
        themeConfig()
        
    }
    

    func createSubControllers() {
        let items = [
            TabBarConfig(vcClass: UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController(), title: "", image: "home", selectImage: "home_on"),
            TabBarConfig(vcName: "FindViewController", title: "发现", image: "find", selectImage: "find_on"),
            TabBarConfig(vcName: "MyViewController", title: "我的", image: "me", selectImage: "me_on"),
        ]
        
        for (index,item) in items.enumerated() {
            var navc: UINavigationController?
            if let _vc = item.vcClass {
                if _vc.isKind(of: UINavigationController.self) {
                    navc = _vc as? UINavigationController
                    navc?.viewControllers.first?.title = item.title
                }else {
                    _vc.title = item.title
                    navc = NavigationController.init(rootViewController: _vc)
                }
                
            }else {
                let vc = ClassForString(item.vcName!).init() as! UIViewController
                vc.title = item.title
                navc = NavigationController.init(rootViewController: vc)
                
            }
            
            if index == 0, tabBar.frame.height == 49 {
                navc?.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
            }
            navc?.tabBarItem.title = item.title
            navc?.tabBarItem.image = UIImage.init(named: item.image)?.withRenderingMode(.alwaysOriginal)
            navc?.tabBarItem.selectedImage = UIImage.init(named: item.selectImage)?.withRenderingMode(.alwaysOriginal)
            
            addChild(navc!)
            
        }
        // 设置颜色
        tabBar.tintColor = UIColor.hexString("#6985FB")
        tabBar.unselectedItemTintColor = UIColor.hexString("#8C96AA")
        
        
    }
    
    func themeConfig(_ backgroundColor: UIColor = .white) {

        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()

            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = backgroundColor
            appearance.shadowColor = UIColor.hexString("#ECEFF5", alpha: 0.8)
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            } else {
                // Fallback on earlier versions
            }
            
            tabBar.standardAppearance = appearance
        }else {
            tabBar.barTintColor = backgroundColor
            tabBar.shadowImage = UIImage.image(color: UIColor.hexString("#ECEFF5", alpha: 0.8), rect: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 0.5))
            tabBar.backgroundImage = UIImage.image(color: UIColor.white)
            
        }
        
    }
    

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 0 {
            themeConfig(UIColor.randColor())
            viewController.tabBarItem.title = ""
            if tabBar.frame.height == 49, let navc = viewControllers?.first {
                navc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
            }
        }else {
            themeConfig()
            if tabBar.frame.height == 49, let navc = viewControllers?.first {
                navc.tabBarItem.imageInsets = .zero
            }
            tabBarController.viewControllers?.first?.tabBarItem.title = "首页"
        }
    }
    
}
