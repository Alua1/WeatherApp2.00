//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by user on 11/24/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weather: Info!

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var ConditionLbl: UILabel!
    @IBOutlet weak var temp_min: UILabel!
    @IBOutlet weak var temp_max: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var cityName: String?
    var temp: String?
    
    @IBOutlet weak var dateLbl: UILabel!
    
    var hours: [Hour] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    @IBAction func SearchBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Second") as! ViewController
//        vc.cityList.append(CityList(cityName: cityName!, temp: temp!))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Weather App"
        
        DataManager.shared.getWeatherByCity(city: "Almaty") { (object, error) in
            if object != nil {
                self.weather = object
                print(self.weather.toJSON())
                self.cityName = self.weather.city.name
                self.temp = (self.weather.list[0].main.temp - 273).forTailingZero() + "°C"
                self.cityLbl.text = self.cityName
                self.ConditionLbl.text = self.weather.list[0].weather[0].description
                self.degreeLbl.text = (self.weather.list[0].main.temp - 273).forTailingZero() + "°C"
                self.temp_min.text = (self.weather.list[0].main.temp_min - 273.15).forTailingZero() + "°C"
                self.temp_max.text = (self.weather.list[0].main.temp_max - 273.15).forTailingZero() + "°C"
//                let date = self.weather.list[0].dt_txt
//                let dateFormatter = DateFormatter()
////                dateFormatter.dateFormat = "hh:mm"
//                dateFormatter.dateFormat = "dd.MM.yyyy"
//                let dateString = dateFormatter.string(from: date!)
                self.dateLbl.text = self.weather.list[0].dt_txt
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

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (hours.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
//        let date = self.hours[indexPath.row].dt_txt
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//        dateFormatter.dateFormat = "dd.MM.yyyy"
//        let dateString = dateFormatter.string(from: date!)
//        self.dateLbl.text = (dateString)
        cell.TimeLbl.text = self.hours[indexPath.row].dt_txt
        cell.TempLbl.text = String(format: "%f",self.hours[indexPath.row].temp!)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
