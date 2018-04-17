//
//  LJBaseNavigationController.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import ChameleonFramework

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBarHairline = true
        // Do any additional setup after loading the view.
        UIApplication.shared.statusBarStyle = .lightContent // 状态栏颜色
        navigationBar.isTranslucent = false // 是否透明
        navigationBar.barTintColor = UIColor.red  // 背景颜色
        navigationBar.tintColor = UIColor.white  // 左右字体颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white] // 中间title样式
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}
