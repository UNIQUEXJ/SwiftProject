//
//  LJTestViewModel.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/13.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import RxSwift
import RxCocoa

final class LJTestViewModel: LJTestViewModelType {
    func transform(input: input) -> output {
        return getLocalString(input: input)
    }
    func getLocalString(input: input) -> output {
        func tranform() -> String {
            return "xxjj"
        }
        let localString = input.refreshTap.map{ tranform() }
        return output(currentValue: localString)
    }
    func getNetString(input: input) -> output {
        let netString = LJTestProvider(withInput: input.refreshTap.asObservable()).rx_currentString
        return output(currentValue: netString)
    }
}
extension LJTestViewModel {
    struct input {
        let refreshTap: Driver<Void>
    }
    struct output {
        let currentValue: Driver<String>
    }
}


