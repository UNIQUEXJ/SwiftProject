//
//  LJTestProvider.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/13.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import RxAlamofire
import RxCocoa
import RxSwift
import Moya

class LJTestProvider {
    let url = "https://www.baidu.com"
    var input: Observable<Void>
    lazy var rx_currentString: Driver<String> = self.getTime()

    init(withInput input: Observable<Void>) {
        self.input = input
    }
    fileprivate func getTime() -> Driver<String> {
        //        网络请求环境下多线程切换 在ui操作后.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        return input.do(onNext: {_ in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        })
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background)).flatMapLatest{ _ in
                return RxAlamofire.requestJSON(.get, self.url).debug()
            }.map{ (response, json) -> String in
                return "XXJJ"
            }
            .do(onNext: {_ in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
            .asDriver(onErrorJustReturn: "")
    }
}

