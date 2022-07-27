//
//  STNavigationController.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit

public extension STSpace where Base: UINavigationController {
    
    var viewControllers: [UIViewController] {
        if base.isKind(of: STNavigationController.self) {
            let vcs = base.viewControllers.compactMap { ($0 as? ContainViewController)?.rootViewController }
            return vcs
        }else if base.isKind(of: ContainNavigationController.self) {
            let vcs = base.viewControllers.first?.st.navigationController?.viewControllers.compactMap { ($0 as? ContainViewController)?.rootViewController }
            return vcs ?? base.viewControllers
        }
        
        return base.viewControllers
        
    }
    
}

open class STNavigationController: UINavigationController {
    
   public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        var _rootViewController = rootViewController
        _rootViewController.st.navigationController = self
        viewControllers = [ContainViewController.containViewController(with: _rootViewController)]
    }
   public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard var first = viewControllers.first else { return }
        first.st.navigationController = self
        viewControllers = [ContainViewController.containViewController(with: first)]
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            if viewController.isKind(of: ContainViewController.self) {
                var backItem: UIBarButtonItem? = viewController.navigationItem.backBarButtonItem ?? viewController.navigationItem.leftBarButtonItem ?? viewController.navigationItem.leftBarButtonItems?.first
                
               let tempController = (viewController as! ContainViewController).rootViewController
                if backItem == nil {
                    backItem = UIBarButtonItem.init(image: UIImage.st.image(named: "nav_back"), style: .plain, target: tempController, action: #selector(leftBarButtonAction))
                    tempController?.addBarButton(backItem!, rightSide: false, merge: false)
                    
                }else {
                    
                    tempController?.navigationItem.backBarButtonItem = viewController.navigationItem.backBarButtonItem
                    tempController?.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem
                    tempController?.navigationItem.leftBarButtonItems = viewController.navigationItem.leftBarButtonItems
                    
                }
                
                
            }
            
            
        }
        
        super.pushViewController(viewController, animated: animated)
//        viewController.navigationItem.backButtonTitle = ""
        
    }
}

extension STNavigationController: UINavigationControllerDelegate {
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let myVC = (viewController as? ContainViewController)?.rootViewController, myVC.popGestureEnabled {
            let isRootVC = viewController == navigationController.viewControllers.first
            self.interactivePopGestureRecognizer?.isEnabled = !isRootVC
        }else {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        
    }
    
}

extension STNavigationController: UIGestureRecognizerDelegate {
    /// 侧滑返回冲突处理
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let scrollView = otherGestureRecognizer.view, scrollView.isKind(of: UIScrollView.self) {
            (scrollView as? UIScrollView)?.panGestureRecognizer.require(toFail: gestureRecognizer)
        }
        return true
    }
    
}
