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
    convenience init(searchText search: String, string str: String, searchColor changeColor: UIColor = LJColor.themeColor, searchFont changeFont: UIFont = LJFont.font_16, isAddLink isLink: Bool = false) {
        self.init(string: str)
        guard let range = str.range(of: search) else {
            return
        }
        if isLink {
            self.addAttribute(NSAttributedStringKey.link, value: "click://", range: str.lj_nsRange(form: range))
        }
        self.addAttributes([NSAttributedStringKey.foregroundColor: changeColor, NSAttributedStringKey.font: changeFont], range: str.lj_nsRange(form: range))
    }
}
