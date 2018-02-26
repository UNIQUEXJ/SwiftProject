//
//  LJ+Rx+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/22.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import RxSwift
import RxCocoa

extension UITextField {
    var lj_validState: AnyObserver<Bool?> {
        return Binder(self, binding: { (textfield, valid) in
            textfield.textColor = valid! ? LJColor.textColor : UIColor.red
        }).asObserver()
    }
}
extension UIButton {
    var lj_validState: AnyObserver<Bool> {
        return Binder(self, binding: { (btn, valid) in
            btn.isEnabled = valid
        }).asObserver()
    }
}
