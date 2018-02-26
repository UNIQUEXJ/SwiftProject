//
//  LJ+UIButton+enxtension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

extension UIButton {
    
    /// 简单设置图片与文字交换前后位置
    func lj_changeImageWidthLabel() {
        titleEdgeInsets = UIEdgeInsetsMake(0, -(imageView?.frame.width)!, 0, (imageView?.frame.width)!)
        imageEdgeInsets = UIEdgeInsetsMake(0, (titleLabel?.frame.width)!, 0, -(titleLabel?.frame.width)!)
    }
}
