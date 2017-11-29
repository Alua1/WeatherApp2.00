//
//  Weather.swift
//  WeatherApp
//
//  Created by user on 11/8/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit
import ObjectMapper


//    var list: [String:Any] = [:]

class Info: Mappable {
        var cnt: Int? = 0
        var list: [List]!
        var city: City!
        required init?(map: Map){}
        func mapping (map: Map){
            cnt   <- map["cnt"]
            list  <- map["list"]
            city  <- map["city"]
        }
}
struct City: Mappable {
    var name: String!
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
    }
}
struct List: Mappable{
    var main: Main!
    var clouds: Clouds!
    var weather: [Weather]!
    //        var sys: Sys!
    var wind: Wind!
    var dt_txt: String?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        main    <- map["main"]
        clouds  <- map["clouds"]
        weather <- map["weather"]
        //sys   <- map["sys"]
        wind    <- map["wind"]
        dt_txt  <- map["dt_txt"]
    }
}
struct Wind: Mappable {
    var speed: Int = 0
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        speed <- map["speed"]
    }
}
struct Weather: Mappable {
    var description: String!
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        description <- map ["description"]
    }
}
//struct Sys: Mappable {
//    var sunset: CLong = 0
//    var sunrise: CLong = 0
//    var country: String = ""
//
//    init?(map: Map) {}
//
//    mutating func mapping(map: Map) {
//        sunset <- map["sunset"]
//        sunrise <- map["sunrise"]
//        country <- map["country"]
//    }
//}
struct Clouds: Mappable {
    var all: Int = 0
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}
struct Main: Mappable {
    var temp: Double = 0
    var pressure: Int = 0
    var temp_min: Double = 0
    var temp_max: Double = 0
    var humidity: Int  = 0
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        temp        <- map["temp"]
        pressure    <- map["pressure"]
        temp_min    <- map["temp_min"]
        temp_max    <- map["temp_max"]
        humidity    <- map["humidity"]
    }
}

