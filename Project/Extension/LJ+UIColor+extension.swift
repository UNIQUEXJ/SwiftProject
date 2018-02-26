//
//  LJ+UIColor+extension.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

extension UIColor {
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(lj_hex hexColor: String) {
        
        // 存储转换后的数值
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0, alpha: UInt32 = 255
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        
        if hexColor.lengthOfBytes(using: .utf8) == 8 {
            Scanner(string: hexColor[6..<8]).scanHexInt32(&alpha)
        }
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
    }
    /// RGB颜色 输入整数
    convenience init(lj_rgb r: Float, _ g: Float, _ b: Float, _ a: Float) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a))
    }
    /// 设置纯黑白颜色
    convenience init(lj_chun rgb: Float, _ a: Float) {
        self.init(red: CGFloat(rgb) / 255, green: CGFloat(rgb) / 255, blue: CGFloat(rgb) / 255, alpha: CGFloat(a))
    }
    
    /// 生成随机颜色
    ///
    /// - Returns: 颜色
    static func lj_randomColor() -> UIColor {
        let weight = CGFloat(arc4random_uniform(1000)) / 1000
        return UIColor(hue: weight, saturation: 1, brightness: 1, alpha: 1)
    }
    /// 绘制颜色图片
    var lj_image: UIImage {
        get {
            let contentWidth: CGFloat = 1
            let contentHeight: CGFloat = 1
            let rect = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
            UIGraphicsBeginImageContext(CGSize(width: contentWidth, height: contentHeight))
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(self.cgColor)
            context?.fill(rect)
            guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
                return UIImage()
            }
            UIGraphicsEndImageContext()
            return img
        }
    }
}
