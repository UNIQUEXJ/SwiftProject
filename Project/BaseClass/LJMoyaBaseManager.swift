//
//  LJMoyaBaseManager.swift
//  RxProject
//
//  Created by 刘蒋 on 2017/11/10.
//  Copyright © 2017年 刘蒋. All rights reserved.
//

import Moya
import Result
import RxSwift
import ObjectMapper
import SwiftyJSON
import MBProgressHUD

fileprivate let lj_baseURL = "http://www.baidu.com/a/mobileapi/"
let rx_provider = MoyaProvider<LJApiManager>(plugins: [LJRequestPlugin()])

enum LJApiManager {
    case Login([String: Any])
    case otherURL
}

extension LJApiManager: TargetType {
    var baseURL: URL {
        switch self {
        case .Login:
            return URL(string: lj_baseURL)!
        default:
            return URL(string: lj_baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .Login:
            return "login"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Login:
            return .post
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .Login:
            return "".data(using: .utf8)!
        default:
            return "".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .Login(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

//var hudStr = ""
//var isHud = false
public final class LJRequestPlugin: PluginType {
    var hud: MBProgressHUD?
    
    public func willSend(_ request: RequestType, target: TargetType) {
//        if isHud {
//            hud = MBProgressHUD.lj_showNet(text: hudStr)
//        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        if isHud {
//            hud?.lj_dismiss()
//            isHud = false
//            hudStr = ""
//        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

extension Observable {
    func mapObject<T: BaseMappable>(type: T.Type) -> Observable<T> {
        return self.map({ response in
            guard let dict = response as? [String: Any], let object = Mapper<T>().map(JSON: dict) else {
                throw LJNetError.JSONError
            }
            return object
        })
    }
    func mapArray<T: BaseMappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            let json = JSON(response)
            guard let array = json["body"].arrayObject as? [[String: Any]] else {
                throw LJNetError.JSONError
            }
            return Mapper<T>().mapArray(JSONArray: array)
        }
    }
}

enum LJNetError: String {
    case JSONError = "JSON解析错误"
    case OtherError = "其他错误"
}
extension LJNetError: Swift.Error {}

