//
//  CustomNavigationColorController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class CustomNavigationColorController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if title == nil {
            title = "自定义导航色"
        }
        view.backgroundColor = .white
        navigationController?.barTintStyle(.custom(UIColor.randColor().withAlphaComponent(0.3), tintColor: UIColor.randColor()))
        // Do any additional setup after loading the view.
        
        view.addSubview(nextBtn)
        
    }
    
    @objc func onNext(_ sender: UIButton) {
        navigationController?.pushViewController(TransparentNavigationController(), animated: true)
    }

    lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.frame = CGRect.init(x: 100, y: 80, width: 80, height: 50)
        btn.addTarget(self, action: #selector(onNext(_:)), for: .touchUpInside)
        return btn
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
