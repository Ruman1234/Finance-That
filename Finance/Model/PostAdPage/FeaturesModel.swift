//
//  FeaturesModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct FeaturesModel : Mappable {
    var data : [FeaturesData]?
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

struct FeaturesData : Mappable {
    var id : Int?
    var v_features : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        v_features <- map["v_features"]
    }

}
