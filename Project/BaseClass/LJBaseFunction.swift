//
//  LJBaseFunction.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import MBProgressHUD

//MARK: - 用于数组和字典转字符串
func lj_jsonString(any: Any) -> String {
    var str = ""
    do {
        let temp = try JSONSerialization.data(withJSONObject: any, options: .prettyPrinted)
        str = String(data: temp, encoding: .utf8) ?? ""
    } catch let err {
        lj_print(err)
    }
    return str
}


func lj_loginView(_ isError: Bool = true) {
    let window = UIApplication.shared.keyWindow
    for item in (window?.subviews)! {
        item.removeFromSuperview()
    }
    window?.backgroundColor = UIColor.white
    window?.rootViewController = ViewController()
    if isError {
        MBProgressHUD.lj_showText(text: "登录过期")
    }
}


// MARK: 简单提示
/// 简单提示
func showAlertAction(hint : String?, viewCtr: UIViewController) {
    let alert = UIAlertController(title: "提示", message: hint, preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel, handler: nil)
    alert.addAction(action)
    viewCtr.present(alert, animated: true, completion: nil)
}

/// print打印
func lj_print<T>(_ message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):(\(lineNum))-\(message)")
    #endif
}


/// 延时执行
typealias TaskBlock = (_ cancel: Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping () -> ()) -> TaskBlock? {
    func dispatch_later(block: @escaping () -> ()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (() -> Void)? = task
    var result: TaskBlock?
    
    let delayedClosure: TaskBlock = { cancel in
        if let internalClosure = closure {
            if cancel == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
}







