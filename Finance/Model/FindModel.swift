//
//  FindModel.swift
//  Finance
//
//  Created by Ammar Irfan on 16/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper

struct FindModel : Mappable {
    var data : FindModleData?
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

struct Body_type : Mappable {
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


struct Category : Mappable {
    var id : Int?
    var name : String?
    var image_path : String?
    var is_active : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
    }

}


struct FindModleData : Mappable {
    var id : Int?
    var user_id : User_id?
    var user_type : Int?
    var dealer_or_private_seller : Int?
    var category : Category?
    var sub_type_id : Int?
    var make : Make?
    var model : Model?
    var year : Int?
    var v_condition : String?
    var kilometer : Int?
    var engine : String?
    var price : String?
    var listing_type : Int?
    var has_bumpup : Int?
    var bumpup_active : Int?
    var stripe_check_id : String?
    var stripe_payment_amount : String?
    var description : String?
    var location : String?
    var city : String?
    var latitude : String?
    var longitude : String?
    var is_sold : Int?
    var is_deleted : String?
    var created_at : String?
    var is_active : Int?
    var reason : String?
    var vin : String?
    var hin : String?
    var serial_number : String?
    var has_lines : String?
    var line_name : String?
    var line_amount : String?
    var line_description : String?
    var accept_charges : String?
    var other_make : String?
    var other_model : String?
    var color : String?
    var trim : String?
    var body_type : Body_type?
    var seating : Int?
    var transmission : String?
    var fuel_type : Fuel_type?
    var drive_train : Drive_train?
    var cylinder : Int?
    var previous_owners : Int?
    var previous_accidents : Int?
    var features : String?
    var updated_price : String?
    var location_coords : String?
    var stock_id : Int?
    var steering_type : String?
    var passengers : String?
    var hours : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        user_id <- map["user_id"]
        user_type <- map["user_type"]
        dealer_or_private_seller <- map["dealer_or_private_seller"]
        category <- map["category"]
        sub_type_id <- map["sub_type_id"]
        make <- map["make"]
        model <- map["model"]
        year <- map["year"]
        v_condition <- map["v_condition"]
        kilometer <- map["kilometer"]
        engine <- map["engine"]
        price <- map["price"]
        listing_type <- map["listing_type"]
        has_bumpup <- map["has_bumpup"]
        bumpup_active <- map["bumpup_active"]
        stripe_check_id <- map["stripe_check_id"]
        stripe_payment_amount <- map["stripe_payment_amount"]
        description <- map["description"]
        location <- map["location"]
        city <- map["city"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        is_sold <- map["is_sold"]
        is_deleted <- map["is_deleted"]
        created_at <- map["created_at"]
        is_active <- map["is_active"]
        reason <- map["reason"]
        vin <- map["vin"]
        hin <- map["hin"]
        serial_number <- map["serial_number"]
        has_lines <- map["has_lines"]
        line_name <- map["line_name"]
        line_amount <- map["line_amount"]
        line_description <- map["line_description"]
        accept_charges <- map["accept_charges"]
        other_make <- map["other_make"]
        other_model <- map["other_model"]
        color <- map["color"]
        trim <- map["trim"]
        body_type <- map["body_type"]
        seating <- map["seating"]
        transmission <- map["transmission"]
        fuel_type <- map["fuel_type"]
        drive_train <- map["drive_train"]
        cylinder <- map["cylinder"]
        previous_owners <- map["previous_owners"]
        previous_accidents <- map["previous_accidents"]
        features <- map["features"]
        updated_price <- map["updated_price"]
        location_coords <- map["location_coords"]
        stock_id <- map["stock_id"]
        steering_type <- map["steering_type"]
        passengers <- map["passengers"]
        hours <- map["hours"]
    }

}


struct Drive_train : Mappable {
    var id : Int?
    var drive_train : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        drive_train <- map["drive_train"]
    }

}


struct Fuel_type : Mappable {
    var id : Int?
    var fuel_type : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        fuel_type <- map["fuel_type"]
    }

}


struct Make : Mappable {
    var id : Int?
    var type_id : Int?
    var sub_type_id : Int?
    var make_name : String?
    var image_path : String?
    var is_active : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type_id <- map["type_id"]
        sub_type_id <- map["sub_type_id"]
        make_name <- map["make_name"]
        image_path <- map["image_path"]
        is_active <- map["is_active"]
    }

}

struct Model : Mappable {
    var id : Int?
    var make_id : Int?
    var model_make : String?
    var is_active : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        make_id <- map["make_id"]
        model_make <- map["model_make"]
        is_active <- map["is_active"]
    }

}

struct User_id : Mappable {
    var id : Int?
    var last_login : String?
    var is_superuser : Bool?
    var password : String?
    var email : String?
    var username : String?
    var user_name : String?
    var full_name : String?
    var user_type : Int?
    var start_date : String?
    var is_staff : Bool?
    var is_active : Bool?
    var is_verified : Bool?
    var credit_point : Int?
    var has_seller_request : Int?
    var modified_at : String?
    var login_type : Int?
    var access_token : String?
    var groups : [String]?
    var user_permissions : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        last_login <- map["last_login"]
        is_superuser <- map["is_superuser"]
        password <- map["password"]
        email <- map["email"]
        username <- map["username"]
        user_name <- map["user_name"]
        full_name <- map["full_name"]
        user_type <- map["user_type"]
        start_date <- map["start_date"]
        is_staff <- map["is_staff"]
        is_active <- map["is_active"]
        is_verified <- map["is_verified"]
        credit_point <- map["credit_point"]
        has_seller_request <- map["has_seller_request"]
        modified_at <- map["modified_at"]
        login_type <- map["login_type"]
        access_token <- map["access_token"]
        groups <- map["groups"]
        user_permissions <- map["user_permissions"]
    }

}
