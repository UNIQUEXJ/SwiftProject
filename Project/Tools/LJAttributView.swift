//
//  LJAttributView.swift
//  Project
//
//  Created by 刘蒋 on 2018/7/9.
//  Copyright © 2018年 刘蒋. All rights reserved.
//

import UIKit

class LJAttributView: UIView, UITextViewDelegate {
    var clickAttributStr: ((String) -> ())?
    private var textView: UITextView?
    var textColor: UIColor = LJColor.textColor {
        didSet {
            textView?.textColor = textColor
        }
    }
    var font: UIFont = LJFont.font_14 {
        didSet {
            textView?.font = font
        }
    }
    var attribuFont: UIFont = LJFont.font_16 {
        didSet {
            setAttributStr()
        }
    }
    var contentStrs: [String] = [] {
        didSet {
            setAttributStr()
        }
    }
    
    func setAttributStr() {
        if contentStrs.count > 1 {
            let str = NSMutableAttributedString(searchText: contentStrs[0], string: contentStrs[1], searchFont: attribuFont, isAddLink: true)
            textView?.attributedText = str
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        textView = UITextView(frame: self.bounds)
        initTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textView = UITextView(coder: aDecoder)
        initTextView()
    }
    func initTextView() {
        textView?.delegate = self
        textView?.isEditable = false
        textView?.isScrollEnabled = false
        addSubview(textView!)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        guard URL.scheme == "click" else {
            return true
        }
        let attribuStr = textView.attributedText.attributedSubstring(from: characterRange)
        self.clickAttributStr?(attribuStr.string)
        return false
    }
}
