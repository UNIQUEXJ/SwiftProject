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
extension LJProtocolCell {
    func setBaseDefaults() {
        guard let cell = self as? UITableViewCell else {
            return
        }
        cell.layer.masksToBounds = true
        cell.contentView.layer.masksToBounds = true
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = UIColor.white
    }
}
