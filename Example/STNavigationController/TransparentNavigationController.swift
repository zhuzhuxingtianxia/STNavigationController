//
//  TransparentNavigationController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/19.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import STNavigationController

class TransparentNavigationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.title == nil {
            self.title = "popToController"
        }
        view.backgroundColor = .white
        
        navigationController?.barTintStyle(.clear)
        // Do any additional setup after loading the view.
        self.st.statusBarStyle(.lightContent)
        view.addSubview(scrollView)
        scrollView.addSubview(button)
        scrollView.addSubview(buttonRoot)
    }
    
    // 修改状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return st.statusBarStyle
    }

    @objc func onBack(_ sender: UIButton) {
        
        if let vc = navigationController?.st.viewControllers.first(where: { $0.isKind(of: DetailViewController.self) }) {
            navigationController?.popToViewController(vc, animated: true)
        }else {
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    @objc func onNext(_ sender: UIButton) {
        navigationController?.pushViewController(Transparent2NavigationController(), animated: true)
    }
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("popToController", for: .normal)
        btn.sizeToFit()
        btn.center = CGPoint.init(x: view.center.x, y: 200)
        btn.addTarget(self, action: #selector(onBack(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var buttonRoot: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ToNext", for: .normal)
        btn.sizeToFit()
        btn.center = CGPoint.init(x: view.center.x, y: 250)
        btn.addTarget(self, action: #selector(onNext(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
//        scroll.contentInsetAdjustmentBehavior = .never
        scroll.frame = CGRect.init(x: 0, y: -kNavigationH, width: view.frame.width, height: view.frame.height)
        scroll.backgroundColor = UIColor.randColor()
        scroll.contentSize = CGSize.init(width: view.bounds.width, height: view.bounds.height * 1.5)
        return scroll
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

extension TransparentNavigationController: UIScrollViewDelegate {
    
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
