//
//  LJ+UIImage+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//
extension UIImageView {
    //  加圆角 UIImage不能为nil
    func lj_addCorner(radius: CGFloat) {
        self.image = self.image?.lj_drawRectWithRoundedCorner(radius: radius, self.bounds.size)
    }
}
extension UIImage {
    /// 生成不变形的img 系数可以调节
    var lj_resizableImage: UIImage {
        get {
            let w = (self.size.width) * 0.5
            let h = (self.size.height) * 0.5
            let newImage = self.resizableImage(withCapInsets: UIEdgeInsets(top: h, left: w, bottom: h, right: w), resizingMode: .stretch)
            return newImage
        }
    }
    func lj_drawRectWithRoundedCorner(radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()!.addPath(UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners,
                                                            cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        UIGraphicsGetCurrentContext()?.clip()
        
        self.draw(in: rect)
        UIGraphicsGetCurrentContext()!.drawPath(using: .fillStroke)
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext();
        return img
    }
}
