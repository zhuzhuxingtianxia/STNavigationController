//
//  NavigationController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class NavigationController: STNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            
            let backItem = UIBarButtonItem.init(image: UIImage.init(named: "nav_back_red"), style: .plain, target: viewController, action: #selector(leftBarButtonAction))
            viewController.addBarButton(backItem, rightSide: false, merge: false)

        }
        
        super.pushViewController(viewController, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
