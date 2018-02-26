//
//  LJTestViewController.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/13.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxCocoa
import RxSwift
import Moya
import RxAlamofire

class LJTestViewController: UIViewController {

    var tempText: UILabel?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tempText = UILabel()
            .lj_addHere(toSuperView: view)
            .lj_layout { (make) in
                make.center.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(100)
            }
            .lj_config { (label) in
                label.backgroundColor = UIColor.red
                label.font = UIFont.systemFont(ofSize: 12)
                label.textAlignment = .center
                label.textColor = UIColor.white
        }

        let btn = UIButton()
            .lj_addHere(toSuperView: view)
            .lj_layout { (make) in
                make.top.equalToSuperview().inset(100)
                make.centerX.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(44)
            }
            .lj_config { (button) in
                button.backgroundColor = UIColor.orange
        }
        //        btn.rx.tap.asDriver().map {
        //            return "xx"
        //            }.drive(tempText!.rx.text)
        //            .disposed(by: disposeBag)
        test0(btn: btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    //MARK: - 测试
    fileprivate func test0(btn: UIButton) {
        let viewModel = LJTestViewModel()
        let input = LJTestViewModel.input(refreshTap: btn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        output.currentValue.drive(tempText!.rx.text).disposed(by: disposeBag)
    }
    fileprivate func test1() {
        LJBaseViewModel.share.settingView(tempText!, ["username": "15701182615", "password": "123456", "mobileLogin": true])
    }
    fileprivate func test2() {
        login().map({ (userModel) -> String in
            return userModel.result.name
        }).asDriver(onErrorJustReturn: "xx").drive(tempText!.rx.text).disposed(by: disposeBag)
    }
    fileprivate func login() -> Observable<UserModel> {
        return rx_provider.rx.request(.Login(["username": "15701182615", "password": "123456", "mobileLogin": true])).filterSuccessfulStatusCodes().asObservable().mapJSON().mapObject(type: UserModel.self)
    }

}

