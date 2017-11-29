//
//  DataManager.swift
//  WeatherApp
//
//  Created by user on 11/8/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class DataManager {
    static let shared = DataManager()
    var date:Double!
    
    typealias completion = (_ object: Info?, _ error: Error?) -> ()
    
    func getWeatherByCity(city: String, completion: @escaping completion) {
        let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/forecast?id=524901" + "&APPID=" + "d9837d714b7ff705079c548def5adec9" + "&q=" + city
        
//        var date: String {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .long
//            dateFormatter.timeStyle = .none
//            let date = Date(timeIntervalSince1970: _date!)
//            return (_date != nil) ? "Today, \(dateFormatter.string(from: date))" : "Date Invalid"
//        }
        
        request(openWeatherMapBaseURL, method: .get).responseObject { (response: DataResponse<Info>) in
            switch response.result {
            case.success(let value):
                print(JSON(value))
                completion(value, nil)
            case.failure(let error):
                completion(nil, error)
                print(error.localizedDescription)
            }
        }
        
    }
}
