//
//  Hours.swift
//  WeatherApp
//
//  Created by user on 11/24/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import Foundation
import ObjectMapper

class Hour{
    var dt_txt: String?
    var temp: Double?

    init(dt_txt: String, temp: Double ){
        self.dt_txt = dt_txt
        self.temp = temp
    }
}

