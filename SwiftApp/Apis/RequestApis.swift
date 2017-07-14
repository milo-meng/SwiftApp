//
//  RequestApis.swift
//  SwiftApp
//
//  Created by 孟超 on 2017/6/2.
//  Copyright © 2017年 孟超. All rights reserved.
//

import Foundation
import Moya
import RxMoya

//private func JSONResponseDataFormatter(_ data: Data) -> Data {
//    do {
//        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//        return prettyData
//    } catch {
//        return data
//    }
//}

let apisProvider = RxMoyaProvider<RequestApis>(
//    plugins:[
//        NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
//    ]
)


public enum RequestApis {
    case getDynamicsPicture
}

extension RequestApis: TargetType {
    
    /// The target's base `URL`.
    public var baseURL: URL {
        return URL(string: "https://166.gopay.pro/globlepay/data/ws/rest/")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        switch self {
        case .getDynamicsPicture:
            return "dynamic/getDynamicsPicture"
        }
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        return .post
    }
    
    /// The parameters to be encoded in the request.
    public var parameters: [String : Any]? {
        return [
            "languageId": 1,
            "token": "",
            "data": ""
        ]
    }
    
    /// The method used for parameter encoding.
    public var parameterEncoding: Moya.ParameterEncoding {
        return JSONEncoding.default
    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    /// The type of HTTP task to be performed.
    public var task: Moya.Task {
        return .request
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    public var validate: Bool {
        return false
    }
}


