//
//  LJProjectBaseSetting.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

let lj_screen = UIScreen.main.bounds
let lj_screenWidth = lj_screen.width
let lj_screenHeight = lj_screen.height
let lj_iphone4 = lj_screenHeight <= 480
let lj_iphone5 = lj_screenHeight <= 568 && lj_screenHeight > 480
let lj_iphone6 = lj_screenHeight <= 730 && lj_screenHeight > 568
let lj_iphone6_plus = lj_screenHeight <= 736 && lj_screenHeight > 667
let lj_iphoneX = lj_screenHeight == 812
let lj_navMargin: CGFloat = lj_iphoneX ? 88 : 64
let lj_tabMargin: CGFloat = lj_iphoneX ? 83 : 49

let lj_ipad = UIDevice.current.userInterfaceIdiom == .pad
let lj_window = UIApplication.shared.keyWindow ?? UIWindow()

struct LJColor {
    static let tableColor = UIColor(lj_chun: 245, 1)
    static let bgColor = UIColor(lj_chun: 245, 1)
    static let textColor = UIColor(lj_chun: 51, 1)
    static let detailTextColor = UIColor(lj_chun: 102, 1)
    static let themeColor = UIColor(lj_hex: "64a250")
}

struct LJFont {
    static let font_10 = UIFont.systemFont(ofSize: 10)
    static let font_11 = UIFont.systemFont(ofSize: 11)
    static let font_12 = UIFont.systemFont(ofSize: 12)
    static let font_13 = UIFont.systemFont(ofSize: 13)
    static let font_14 = UIFont.systemFont(ofSize: 14)
    static let font_15 = UIFont.systemFont(ofSize: 15)
    static let font_16 = UIFont.systemFont(ofSize: 16)
    static let font_17 = UIFont.systemFont(ofSize: 17)
    static let font_18 = UIFont.systemFont(ofSize: 18)
    static let font_19 = UIFont.systemFont(ofSize: 19)
    static let font_20 = UIFont.systemFont(ofSize: 20)
    static let font_21 = UIFont.systemFont(ofSize: 21)
    static let font_22 = UIFont.systemFont(ofSize: 22)
    static let font_23 = UIFont.systemFont(ofSize: 23)
    static let font_24 = UIFont.systemFont(ofSize: 24)
}
