//
//  ViewController+NavigationItem.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit

extension UIViewController {
    
    public func addBarButtonItem(by image: UIImage, action: Selector?, rightSide:Bool = true, merge: Bool = false) {
        let btn = UIButton(type: .system)
        btn.frame = CGRect.init(x: 0, y: 0, width: image.size.width > 36 ? image.size.width : 36, height: image.size.height)
        btn.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        if rightSide {
            
        }else {
            btn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        }
        
        var _action = action
        if action == nil {
            _action = rightSide ? #selector(rightBarButtonAction) : #selector(leftBarButtonAction)
        }
        
        btn.addTarget(self, action: _action!, for: .touchUpInside)
        let barItem = UIBarButtonItem.init(customView: btn)
        
        addBarButton(barItem, rightSide: rightSide, merge: merge)
        
    }
    
    public func addBarButton(_ item: UIBarButtonItem, rightSide:Bool, merge: Bool) {
        
        if rightSide {
            if merge {
                var array: [UIBarButtonItem] = []
                array.append(contentsOf: navigationItem.rightBarButtonItems ?? [])
                array.insert(item, at: 0)
                navigationItem.rightBarButtonItems = array
            }else {
                navigationItem.rightBarButtonItem = item
            }
        }else {
            if merge {
                var array: [UIBarButtonItem] = []
                array.append(contentsOf: navigationItem.leftBarButtonItems ?? [])
                array.insert(item, at: 0)
                navigationItem.leftBarButtonItems = array
            }else {
                navigationItem.leftBarButtonItem = item
            }
            
        }
        
    }
    
    
    @objc open func rightBarButtonAction() {
        
    }
    @objc open func leftBarButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
}

