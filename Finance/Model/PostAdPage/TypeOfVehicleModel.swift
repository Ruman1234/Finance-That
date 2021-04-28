//
//  TypeOfVehicleModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct TypeOfVehicleModel : Mappable {
    var data : [TypeOfVehicleData]?
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

struct TypeOfVehicleData : Mappable {
    var id : Int?
    var name : String?
    var image_path : String?
    var is_active : Int?
    var typeofvehicle_id : [TypeofVehicle_id]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
        typeofvehicle_id <- map["typeofvehicle_id"]
    }

}


struct TypeofVehicle_id : Mappable {
    var id : Int?
    var name : String?
    var image_path : String?
    var type_id : Int?
    var is_active : Int?
    

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
        type_id <- map["type_id"]
        is_active <- map["is_active"]
    }

}
