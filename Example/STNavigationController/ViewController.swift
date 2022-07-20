//
//  ViewController.swift
//  STNavigationController
//
//  Created by 猪猪行天下 on 07/19/2022.
//  Copyright (c) 2022 猪猪行天下. All rights reserved.
//

import UIKit
import STNavigationController
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view, typically from a nib.
        title = "自定义导航"
        navigationController?.barTintStyle()
        let testView = UIView()
        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(kNavigationH)
            make.bottom.equalToSuperview().offset(-(tabBarController?.tabBar.frame.height ?? 0))
        }
        
    }
    
    @IBAction func pushDetail(_ sender: Any) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

