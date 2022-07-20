//
//  MyViewController.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit
import SnapKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        setupUI()
        setupLayouts()
        
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nextBtn)
    }
    
    func setupLayouts() {
        scrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(tabBarController?.tabBar.frame.height ?? 0))
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.bounds.width)
            make.height.greaterThanOrEqualToSuperview().offset(1)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    @objc func onNext(_ sender: UIButton) {
        navigationController?.pushViewController(CustomNavigationColorController(), animated: true)
    }
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.backgroundColor = UIColor.systemPink.withAlphaComponent(0.3)
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hexString("#6882EE")
        return v
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(onNext(_:)), for: .touchUpInside)
        return btn
    }()

}
