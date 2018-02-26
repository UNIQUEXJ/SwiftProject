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

extension LJProtocolTable {
    func setBaseDefaults() {
        guard let tb = self as? UITableView else {
            return
        }
        tb.backgroundColor = LJColor.tableColor
        tb.tableFooterView = UIView()
    }
}
