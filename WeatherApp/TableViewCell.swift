//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by user on 11/24/17.
//  Copyright © 2017 Alua. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var TimeLbl: UILabel!
    @IBOutlet weak var IconLbl: UILabel!
    @IBOutlet weak var TempLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
