//
//  TableViewController.swift
//  WeatherApp
//
//  Created by user on 11/24/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var cityList: [CityList] = [] 
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ListTableViewCell
//        print(cityList[indexPath.row].cityName!)
        cell.cityNameLabel.text = cityList[indexPath.row].cityName
        cell.cityTempLabel.text = cityList[indexPath.row].temp
        //cell.degreeLbl.text = "17 C"
        cell.cityNameLabel.adjustsFontSizeToFitWidth = true;
        cell.cityTempLabel.adjustsFontSizeToFitWidth = true;
        
        return cell
    }

}
