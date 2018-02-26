//
//  LJBaseObject.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/8.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import ObjectMapper
/// 实例
class TestModel: Mappable {
    var birthday: Date?
    var isBool = false
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        birthday <- (map["birthday"], transfromOfDateAndString())
        isBool <- map["isBool"]
    }
}

// MARK: 将double类型时间戳转成Date
func transfromOfDateAndString() ->TransformOf<Date , Double>{
    return TransformOf<Date , Double>.init(fromJSON: { (JSONDouble) -> Date? in
        if let dou = JSONDouble {
            return Date(timeIntervalSince1970: dou * 0.001)
        }
        return nil
    }, toJSON: { (date) -> Double? in
        if let date = date{
            return date.timeIntervalSince1970 * 1000
        }
        return nil
    })
}

/// string转成时间
///
/// - Returns: <#return value description#>
func transfromOfDateAndFormateString() -> TransformOf<Date, String>{
    return TransformOf<Date, String>.init(fromJSON: { (JSONString) -> Date? in
        guard let str = JSONString else {
            return nil
        }
        return str.lj_date(.ymdHms)
    }, toJSON: { (date) -> String? in
        guard let tempDate = date else {
            return nil
        }
        return tempDate.lj_string(.ymdHms)
    })
}

/// string转换成Double
///
/// - Returns: <#return value description#>
func transformofDoubleAndString() -> TransformOf<Double, String> {
    return TransformOf<Double, String>.init(fromJSON: { (JSONString) -> Double? in
        guard let str = JSONString else {
            return nil
        }
        return Double(str) ?? 0.0
    }, toJSON: { (JSONDouble) -> String? in
        guard let dou = JSONDouble else {
            return nil
        }
        return String(format: "%.2f", dou)
    })
}

/// string转换成Int
///
/// - Returns: <#return value description#>
func transformofIntAndString() -> TransformOf<Int, String> {
    return TransformOf<Int, String>.init(fromJSON: { (JSONString) -> Int? in
        guard let str = JSONString else {
            return nil
        }
        return Int(str) ?? 0
    }, toJSON: { (JSONInt) -> String? in
        guard let i = JSONInt else {
            return nil
        }
        return "\(i)"
    })
}

