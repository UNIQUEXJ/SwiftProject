//
//  LJBaseViewModel.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/13.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import Moya
import RxSwift
import ObjectMapper
import RxCocoa

protocol LJViewModelType {
    associatedtype input
}
//extension LJBaseViewModel {
//    struct input {
//        let refreshTap: UILabel
//    }
//}
final class LJBaseViewModel {
    
    let disposeBag = DisposeBag()
    
    init() {
        
    }
    
    static var share: LJBaseViewModel {
        struct Static {
            static let instance: LJBaseViewModel = LJBaseViewModel()
        }
        return Static.instance
    }
    func login(_ paras: [String: Any]) -> Observable<TestModel> {
        return rx_provider.rx.request(.Login(paras)).filterSuccessfulStatusCodes().asObservable().mapJSON().mapObject(type: TestModel.self)
    }
    func settingView(_ label: UILabel, _ paras: [String: Any]) {
        rx_provider.rx.request(.Login(paras)).filterSuccessfulStatusCodes().asObservable().mapJSON().mapObject(type: UserModel.self).map{ model in
                return model.result.name
            }.bind(to: label.rx.text).disposed(by: disposeBag)
    }
}
