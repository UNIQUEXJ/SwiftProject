//
//  LJBasicTabBarItemContentView.swift
//  RxProject
//
//  Created by 刘蒋 on 2018/1/4.
//  Copyright © 2018年 刘蒋. All rights reserved.
//

import ESTabBarController_swift

class LJBasicTabBarItemContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        highlightTextColor = LJColor.themeColor
        highlightIconColor = LJColor.themeColor
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
