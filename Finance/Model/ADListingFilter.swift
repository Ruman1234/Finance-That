//
//  ADListingFilter.swift
//  Finance
//
//  Created by Ammar Irfan on 06/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct ADListingFilterModel : Mappable {
    var data : Data?
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

struct Data : Mappable {
    var type_of_vehicle : [Type_of_vehicle]?
    var vehicle_make : [Vehicle_make]?
    var vehicle_model : [Vehicle_model]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        type_of_vehicle <- map["type_of_vehicle"]
        vehicle_make <- map["vehicle_make"]
        vehicle_model <- map["vehicle_model"]
    }

}

struct Type_of_vehicle : Mappable {
    var id : Int?
    var name : String?
    var image_path : String?
    var is_active : Int?
    var vt_count : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
        vt_count <- map["vt_count"]
    }

}

struct Vehicle_make : Mappable {
    var id : Int?
    var type_id : Int?
    var sub_type_id : Int?
    var make_name : String?
    var image_path : String?
    var is_active : Int?
    var mk_count : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type_id <- map["type_id"]
        sub_type_id <- map["sub_type_id"]
        make_name <- map["make_name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
        mk_count <- map["mk_count"]
    }

}

struct Vehicle_model : Mappable {
    var id : Int?
    var make_id : Int?
    var model_make : String?
    var is_active : Int?
    var md_count : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        make_id <- map["make_id"]
        model_make <- map["model_make"]
        is_active <- map["is_active"]
        md_count <- map["md_count"]
    }

}
