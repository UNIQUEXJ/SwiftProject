//
//  Model.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/10.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import ObjectMapper

class LJBaseModel<T: Mappable>: Mappable {
    var success: Bool = false
    var data: T?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}
class LJBaseArrayModel<T: Mappable>: Mappable {
    var success: Bool = false
    var data: [T]?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}

class UserModel: Mappable {
    
    var success: Bool!
    var result: LJResult!
    
    required init?(map: Map) {}
    
    init() {
        self.success = false
        self.result = LJResult()
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        result <- map["body"]
    }
}
class LJResult: Mappable {
    
    var name: String!
    
    required init?(map: Map) {}
    
    init() {
        self.name = ""
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
