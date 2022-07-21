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
        popGestureEnabled = false
        
        view.addSubview(label)
        view.addSubview(button)
    }
    
    @objc func onSwitch(_ sender: UISwitch) {
        popGestureEnabled = sender.isOn
        label.text = sender.isOn ? "侧滑返回" : "禁止侧滑返回"
        label.sizeToFit()
    }
    
    lazy var button: UISwitch = {
        let btn = UISwitch()
        btn.center = CGPoint.init(x: view.center.x, y: 200)
        btn.addTarget(self, action: #selector(onSwitch(_:)), for: .valueChanged)
        return btn
    }()
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "禁止侧滑返回"
        label.sizeToFit()
        label.center = CGPoint.init(x: view.center.x, y: 160)
        return label
    }()
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
