//
//  ResetCompleteModel.swift
//  Finance
//
//  Created by Ammar Irfan on 12/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResetCompleteModel : Mappable {
    var data : [String]?
    var status : Bool?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        data <- map["data"]
        status <- map["status"]
        message <- map["message"]
    }

}
