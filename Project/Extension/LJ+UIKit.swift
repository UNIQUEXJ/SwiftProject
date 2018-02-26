//
//  LJ+UIKit.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/12/22.
//  Copyright © 2017年 刘蒋. All rights reserved.
//
func viewController(forStoryboardName: String) -> UIViewController {
    return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
}

class LJTemplateImageView: UIImageView {
    @IBInspectable var templateImage: UIImage? {
        didSet {
            image = templateImage?.withRenderingMode(.alwaysTemplate)
        }
    }
}
class LJOriginalImageView: UIImageView {
    @IBInspectable var originalImage: UIImage? {
        didSet {
            image = originalImage?.withRenderingMode(.alwaysOriginal)
        }
    }
}
