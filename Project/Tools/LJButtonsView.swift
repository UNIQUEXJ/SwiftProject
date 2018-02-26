//
//  LJButtonsView.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/27.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LJButtonsView: UIView {
    
    let disposeBag = DisposeBag()
    
    var buttonClickComplete: ((Int) -> ())?
    var selectIndex = 0 {
        didSet {
            for item in self.subviews {
                if item.isKind(of: UIButton.self) {
                    let tempBtn = item as! UIButton
                    if tempBtn.tag == selectIndex {
                        btnClick(tempBtn)
                    }
                }
            }
        }
    }
    fileprivate lazy var allButton = UIButton()
    fileprivate lazy var relieveButton = UIButton()
    fileprivate lazy var pendingReleaseButton = UIButton()
    fileprivate lazy var blueView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        backgroundColor = UIColor.white
        setUI(frame, buttonTitles)
    }
    
    fileprivate func btnClick(_ sender: UIButton) {
        for item in self.subviews {
            if item.isKind(of: UIButton.self) {
                let tempBtn = item as! UIButton
                tempBtn.isSelected = false
            }
        }
        sender.isSelected = true
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.blueView.frame = CGRect(x: (self?.frame.width)! / 12 + CGFloat(sender.tag) * (self?.frame.width)! / 3, y: (self?.frame.height)! - 3, width: (self?.frame.width)! / 6, height: 3)
        })
        buttonClickComplete?(sender.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LJButtonsView {
    fileprivate func setUI(_ frame: CGRect, _ btnStrs: [String]) {
        for i in 0 ..<  btnStrs.count {
            let btn = UIButton()
            btn.setTitle(btnStrs[i], for: .normal)
            btn.setTitleColor(LJColor.themeColor, for: .selected)
            btn.setTitleColor(LJColor.textColor, for: .normal)
            btn.titleLabel?.font = LJFont.font_17
            if i == 0 {
                btn.isSelected = true
            }
            btn.tag = i
            btn.frame = CGRect(x: CGFloat(i) * frame.width / 3, y: 0, width: frame.width / 3, height: frame.height - 3)
            btn.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.btnClick(btn)
            }).disposed(by: disposeBag)
            addSubview(btn)
        }
        blueView.backgroundColor = LJColor.themeColor
        blueView.frame = CGRect(x: frame.width / 12, y: frame.height - 3, width: frame.width / 6, height: 3)
        addSubview(blueView)
    }
}


