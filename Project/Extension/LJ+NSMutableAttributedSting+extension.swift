//
//  LJ+NSMutableAttributedSting+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

extension NSMutableAttributedString {
    
    /// 设置指定字特殊颜色
    ///
    /// - Parameters:
    ///   - search: 指定字
    ///   - changeColor: 颜色
    ///   - str: all String
    convenience init(searchText search: String, searchColor changeColor: UIColor, string str: String) {
        self.init(string: str)
        guard let range = str.range(of: search) else {
            return
        }
        self.addAttributes([NSAttributedStringKey.foregroundColor: changeColor], range: str.lj_nsRange(form: range))
    }
}
