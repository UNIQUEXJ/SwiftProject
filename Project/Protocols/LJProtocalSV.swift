//
//  LJProtocalSV.swift
//  RxProject
//
//  Created by 刘蒋 on 2018/1/4.
//  Copyright © 2018年 刘蒋. All rights reserved.
//

import UIKit

protocol LJProtocalSV {
    func setBaseDefaults()
}
extension LJProtocalSV where Self: UIScrollView {
    func setBaseDefaults() {
        self.bounces = false
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = true
    }
}

