//
//  BaseViewController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/20.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.barTintStyle()
        // Do any additional setup after loading the view.
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
