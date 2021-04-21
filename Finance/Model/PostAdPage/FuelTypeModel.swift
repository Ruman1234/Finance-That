//
//  FuelTypeModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct FuelTypeModel : Mappable {
    var data : [FuelTypeData]?
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

struct FuelTypeData : Mappable {
    var id : Int?
    var fuel_type : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        fuel_type <- map["fuel_type"]
    }

}
