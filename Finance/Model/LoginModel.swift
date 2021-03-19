//
//  LoginModel.swift
//  Finance
//
//  Created by Ammar Irfan on 11/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginModel : Mappable {
    var data : LoginModelArray?
    var success : Bool?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        data <- map["data"]
        success <- map["success"]
        message <- map["message"]
    }

}

struct LoginModelArray : Mappable {
    var refresh : String?
    var access : String?
    var user : String?
    var id : Int?
    var user_type : Int?
    var is_active : Bool?
    var is_verified : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        refresh <- map["refresh"]
        access <- map["access"]
        user <- map["user"]
        id <- map["id"]
        user_type <- map["user_type"]
        is_active <- map["is_active"]
        is_verified <- map["is_verified"]
    }

}
