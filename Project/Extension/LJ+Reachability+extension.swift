//
//  LJ+Reachability+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import MBProgressHUD
import Reachability

var lj_reachability: Reachability?
extension Reachability {
    
    /// 是否有网络
    var lj_isNet: Bool {
        get {
            guard let reachability = lj_reachability else {
                return true
            }
            switch reachability.connection {
            case .wifi, .cellular:
                return true
            case .none:
                MBProgressHUD.lj_showText(text: "无网络连接,请检查网络设置")
                return false
            }
        }
    }
    
    /// 显示网络状态
    func lj_showStatus() {
        guard let reachability = lj_reachability else {
            return
        }
        switch reachability.connection {
        case .wifi:
            break;
        case .cellular:
            break
        case .none:
            MBProgressHUD.lj_showText(text: "无网络连接,请检查网络设置")
        }
    }
}
