//
//  BaseResp.swift
//  SwiftApp
//
//  Created by 孟超 on 2017/6/4.
//  Copyright © 2017年 孟超. All rights reserved.
//

import Foundation
import ObjectMapper
import RxMoya

class BaseResp<T: Any>: Mappable {
    var status: Int = 0
    var msg: String = ""
    var data: T?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        data <- map["data"]
    }
    
}
