//
//  DetailViewController.swift
//  Test
//
//  Created by ZZJ on 2022/6/20.
//

import UIKit
import STNavigationController

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randColor()
        navigationController?.barTintStyle()
        
        // Do any additional setup after loading the view.
        self.title = "详情页"
        view.addSubview(button)
        view.addSubview(nextBtn)
        
    }
    
    @objc func onBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @objc func onNext(_ sender: UIButton) {
        navigationController?.pushViewController(CustomNavigationColorController(), animated: true)
    }
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("返回", for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(onBack(_:)), for: .touchUpInside)
        return btn
    }()
    
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
