//
//  BodyTypeModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct BodyTypeModel : Mappable {
    var data : [BodyTypeData]?
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

struct BodyTypeData : Mappable {
    var id : Int?
    var type_id : Int?
    var body_type : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type_id <- map["type_id"]
        body_type <- map["body_type"]
    }

}
