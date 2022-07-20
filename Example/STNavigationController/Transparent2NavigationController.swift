//
//  Transparent2NavigationController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/20.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class Transparent2NavigationController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "popToRoot"
        
        navigationController?.barTintStyle(.clear)
        // Do any additional setup after loading the view.
        self.st.statusBarStyle(.lightContent)
        view.addSubview(scrollView)
        scrollView.addSubview(buttonRoot)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 适配iOS13以下系统
        navigationController?.barBackgroudView?.alpha = 0
    }
    // 修改状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return st.statusBarStyle
    }
    
    @objc func onBackRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    lazy var buttonRoot: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("popToRoot", for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(onBackRoot(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.frame = CGRect.init(x: 0, y: -kNavigationH, width: view.frame.width, height: view.frame.height)
        scroll.backgroundColor = .systemPink
        scroll.contentSize = CGSize.init(width: view.bounds.width, height: view.bounds.height * 1.5)
        return scroll
    }()
    
    
}

extension Transparent2NavigationController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        if scrollView.contentOffset.y > 10 {
            navigationBarWithAlpha()
        }else {
            navigationBarWithAlpha(scrollView.contentOffset.y / 10.0)
        }
        
    }
    
    func navigationBarWithAlpha(_ alpha: CGFloat = 1.0) {
        navigationController?.barBackgroudView?.alpha = alpha
        
        if alpha >= 1.0 {
            if #available(iOS 13.0, *) {
                navigationController?.barTintStyle(.white)
            }else {
                navigationController?.navigationBar.tintColor = UIColor.black
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            }
            self.st.statusBarStyle(.default)
            
        }else {
            if #available(iOS 13.0, *) {
                navigationController?.barTintStyle(.clear)
            }else {
                navigationController?.navigationBar.tintColor = UIColor.white
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            }
            self.st.statusBarStyle(.lightContent)
            
        }
        
    }
    
}

