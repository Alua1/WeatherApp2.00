//
//  ViewController.swift
//  WeatherApp
//
//  Created by Saulebekov Azamat on 29.10.17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var degreeLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet var temp_max: UILabel!
    @IBOutlet var temp_min: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var degree:Double!
    var condition: String!
    var imgURL: String!
    var city:String!
    var date:Double!
    
    var weather: Info!
    var cities:[CityList] = []
    
    var hours:[Hour] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    
    @IBAction func ListBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "table") as! TableViewController
        vc.cityList = cities
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.title = "Weather App"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.TempLbl.text = String(format: "%f",self.hours[indexPath.row].temp!)
        cell.TimeLbl.text = hours[indexPath.row].dt_txt
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DataManager.shared.getWeatherByCity(city: searchBar.text!) { (object, error) in
            if object != nil {
                self.weather = object
                print(self.weather.toJSON())
//                self.weather.list[0].city.name
                self.cityLbl.text = self.weather.city.name
                self.conditionLbl.text = self.weather.list[0].weather[0].description
                self.degreeLbl.text = (self.weather.list[0].main.temp - 273).forTailingZero() + "°C"
                self.temp_min.text = (self.weather.list[0].main.temp_min - 273).forTailingZero() + "°C"
                self.temp_max.text = (self.weather.list[0].main.temp_max - 273).forTailingZero() + "°C"
                let date = Date()
//                    self.weather.list[0].dt_txt
                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "hh:mm"
                dateFormatter.dateFormat = "dd.MM.yyyy"
                let dateString = dateFormatter.string(from: date)
                self.dateLbl.text = dateString
                self.cities.append(CityList(cityName:self.weather.city.name, temp: (self.weather.list[0].main.temp - 273.15).forTailingZero() + "°C"))
                for hour in self.weather.list{
                    self.hours.append(Hour(dt_txt: hour.dt_txt!,temp: hour.main.temp))
                }
                self.degreeLbl.adjustsFontSizeToFitWidth = true;
                self.temp_max.adjustsFontSizeToFitWidth = true;
                self.temp_min.adjustsFontSizeToFitWidth = true;
                //                    self.temp.adjustFontSizeToFitWidth = true;
                self.dateLbl.adjustsFontSizeToFitWidth = true;
            }
        }
    }
    
    

}

