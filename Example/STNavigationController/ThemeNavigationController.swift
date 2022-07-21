//
//  ThemeNavigationController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/21.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class ThemeNavigationController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "图片主题"
        // Do any additional setup after loading the view.
        navigationController?.barTintStyle(.theme(UIImage(named: "top_bg")!, tintColor: .white))
        
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
