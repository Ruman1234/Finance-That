//
//  DriveTrainModel.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct DriveTrainModel : Mappable {
    var data : [DriveTrainData]?
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

struct DriveTrainData : Mappable {
    var id : Int?
    var drive_train : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        drive_train <- map["drive_train"]
    }

}
