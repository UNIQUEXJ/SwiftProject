//
//  LJ+NSNumber+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

extension NSNumber {
    /// 数字格式化成字符串,可以加入.啊 之类  字符串为 1234567.89
    
    //    case none          //1234567.89
    
    //    case decimal       //1,234,567.89
    //
    //    case currency      //￥1,234,567.89
    //
    //    case percent       //123,456,789%
    //
    //    case scientific    //1.23456789E6
    //
    //    case spellOut      //一百二十三万四千五百六十七点八九
    //
    //    @available(iOS 9.0, *)
    //    case ordinal       //第123,4568
    //
    //    @available(iOS 9.0, *)
    //    case currencyISOCode//CNY1,234,567.89
    //
    //    @available(iOS 9.0, *)
    //    case currencyPlural //1,234,567.89人民币
    //
    //    @available(iOS 9.0, *)
    //    case currencyAccounting//￥1,234,567.89
    func lj_formaterString(withStyle style: NumberFormatter.Style) -> String {
        let format = NumberFormatter()
        format.numberStyle = style
        return format.string(from: self) ?? ""
    }
}
