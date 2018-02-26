//
//  LJFlipContentView.swift
//  RxProject
//
//  Created by 刘蒋 on 2018/1/4.
//  Copyright © 2018年 刘蒋. All rights reserved.
//

import UIKit

class LJFlipContentView: LJBasicTabBarItemContentView {
    
    public var duration = 0.3
    public var tran = Tran.y
    enum Tran: String {
        case y = "transform.rotation.y"
        case x = "transform.rotation.x"
        case z = "transform.rotation.z"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.flipAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.flipAnimation()
        completion?()
    }
    
    func flipAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: tran.rawValue)
        impliesAnimation.values = [0, Double.pi * 0.5, Double.pi, Double.pi * 1.5, Double.pi * 2]
        impliesAnimation.duration = duration * 3
        impliesAnimation.calculationMode = kCAAnimationCubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
    
}

