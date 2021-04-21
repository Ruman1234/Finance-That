//
//  SelectMakeModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//


import Foundation
import ObjectMapper

struct SelectMakeModel : Mappable {
    var data : [SelectMakeData]?
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

struct SelectMakeData : Mappable {
    var id : Int?
    var type_id : Int?
    var sub_type_id : Int?
    var make_name : String?
    var image_path : String?
    var is_active : Int?
    var sort_order : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type_id <- map["type_id"]
        sub_type_id <- map["sub_type_id"]
        make_name <- map["make_name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
        sort_order <- map["sort_order"]
    }

}
