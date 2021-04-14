//
//  ADLatitudeAndLongitudeModel.swift
//  Finance
//
//  Created by Ammar Irfan on 06/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct ADLatitudeAndLongitudeModel : Mappable {
    var data : [String]?
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