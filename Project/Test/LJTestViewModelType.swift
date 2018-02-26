//
//  LJTestViewModelType.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/13.
//  Copyright © 2017年 刘蒋. All rights reserved.
//


/// viewmodel的协议 一个输入 一个输出
protocol LJTestViewModelType {
    associatedtype input
    associatedtype output
    func transform(input: input) -> output
}
