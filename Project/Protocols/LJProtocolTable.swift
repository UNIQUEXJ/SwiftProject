//
//  LJProtocolTable.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

protocol LJProtocolTable {
    func setBaseDefaults()
}

extension LJProtocolTable where Self: UITableView {
    func setBaseDefaults() {
        self.backgroundColor = LJColor.tableColor
        self.tableFooterView = UIView()
    }
}
