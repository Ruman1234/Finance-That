//
//  ModelRetrieveModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct SelectModel : Mappable {
    var data : [SelectModelData]?
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

struct SelectModelData : Mappable {
    var id : Int?
    var make_id : Int?
    var model_make : String?
    var v_trim : String?
    var is_active : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        make_id <- map["make_id"]
        model_make <- map["model_make"]
        v_trim <- map["v_trim"]
        is_active <- map["is_active"]
    }

}
