//
//  LJ+UIView+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import SnapKit

protocol ViewChainable {}

extension ViewChainable where Self: UIView {
    @discardableResult
    func lj_config(_ lj_config: (Self) -> Void) -> Self {
        lj_config(self)
        return self
    }
}

extension UIView: ViewChainable {
    func lj_addHere(toSuperView: UIView) -> Self {
        toSuperView.addSubview(self)
        return self
    }
    @discardableResult
    func lj_layout(snapKitMaker: (ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
        return self
    }
}
extension UIView {
    //    let rectCorners: UIRectCorner = [.topLeft, .topRight]
    //    如果view没有size的时候要先传入size
    func lj_settingRadioLayerMask(_ rectCorners: UIRectCorner, _ radid: CGSize) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        let maskPath = UIBezierPath(roundedRect: maskLayer.bounds, byRoundingCorners: rectCorners, cornerRadii: radid)
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable public var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable public var zPosition: CGFloat {
        get {
            return layer.zPosition
        }
        
        set {
            layer.zPosition = newValue
        }
    }
}
