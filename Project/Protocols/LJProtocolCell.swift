//
//  LJProtocolCell.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

protocol LJProtocolCell {
    func setBaseDefaults()
}
extension LJProtocolCell where Self: UITableViewCell {
    func setBaseDefaults() {
        self.layer.masksToBounds = true
        self.contentView.layer.masksToBounds = true
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.white
    }
}
