//
//  LJBaseFunction.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import MBProgressHUD

func lj_setDefaulteInfo( statusStyle: UIStatusBarStyle? = .lightContent, ctr: UIViewController, titleColor: UIColor? = UIColor.gray, textColor: UIColor? = UIColor.gray,  bgColor: UIColor? = UIColor.white) {
    //    ctr.navigationController?.navigationBar.backgroundColor = bgColor
    ctr.navigationController?.navigationBar.setBackgroundImage(bgColor?.lj_image, for: .default)
    UIApplication.shared.statusBarStyle = statusStyle!
    let bar = ctr.navigationController?.navigationBar
    let attr = [NSAttributedStringKey.foregroundColor: titleColor ?? UIColor.gray]
    bar?.titleTextAttributes = attr
    bar?.tintColor = textColor
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







