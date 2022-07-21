//
//  CustomNavigationColorController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
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
        
        setupUI()
        setupLayouts()
        
    }
    
    func setupUI() {
        view.addSubview(nextBtn)
        view.addSubview(themeBtn)
    }
    
    func setupLayouts() {
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
        }
        
        themeBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextBtn.snp.bottom).offset(20)
        }
    }
    
    
    @objc func onNext(_ sender: UIButton) {
        navigationController?.pushViewController(TransparentNavigationController(), animated: true)
    }
    @objc func onThemeNavigation(_ sender: UIButton) {
        navigationController?.pushViewController(ThemeNavigationController(), animated: true)
    }

    lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(onNext(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var themeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ThemeNavigation", for: .normal)
        btn.addTarget(self, action: #selector(onThemeNavigation(_:)), for: .touchUpInside)
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
