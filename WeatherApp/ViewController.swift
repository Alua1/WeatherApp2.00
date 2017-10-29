//
//  ViewController.swift
//  WeatherApp
//
//  Created by Saulebekov Azamat on 29.10.17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var degreeLbl: UILabel!
    
    var degree:Int!
    var condition: String!
    var imgURL: String!
    var city:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
        let openWeatherMapAPIKey = "d9837d714b7ff705079c548def5adec9"
            // This is a pretty simple networking task, so the shared session will do.
        let session = Foundation.URLSession.shared

        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")
        //let request = URLRequest(url: weatherRequestURL as URL)

//        let task = session.dataTask(with: weatherRequestURL!) { data,response, error ->  Void  in
//            if error  == nil{
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
//                    if let weather = json["weather"] as? [String: AnyObject]{
//                        if let condition = weather[main] as? [String: AnyObject] {
//                            self.condition = main
//                            self.imgURL = icon as? String
//                        }
//                        if let main = json["main"] as?[String:AnyObject]{
//                            if let temp = main["temp"] as? Int{
//                                self.degree = temp
//                            }
//                        }
//                    }
//                    if let name = json["name"] as? [String:AnyObject]{
//                        self.city = name
//                    }
//
//                }
//            }
//
////        let urlRequest = URLRequest(url: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!)
//
//        }
        
        let task = session.dataTask(with: weatherRequestURL!) { data, response, error -> Void in
            if let jsonData = data{
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                
            }
                
            else if let requestError = error{
                print("\(requestError) error")
            }
            else{
                print("Unexpected error")
            }
        }
        
        
    }


}

