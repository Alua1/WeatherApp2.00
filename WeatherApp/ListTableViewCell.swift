//
//  ListTableViewCell.swift
//  WeatherApp
//
//  Created by user on 11/24/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    

}
