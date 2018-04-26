//
//  LJProtocolTableVC.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

protocol LJProtocolTableVC {
    func setBaseDefaults()
}
extension LJProtocolTableVC where Self: UITableViewController {
    func setBaseDefaults() {
        self.automaticallyAdjustsScrollViewInsets = true
        let weight = CGFloat(arc4random_uniform(1000)) / 1000
        self.view.backgroundColor = UIColor(hue: weight, saturation: 1, brightness: 1, alpha: 1)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tableView.tableFooterView = UIView()
    }
}

