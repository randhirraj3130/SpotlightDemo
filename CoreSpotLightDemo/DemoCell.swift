//
//  DemoCell.swift
//  CoreSpotLightDemo
//
//  Created by Randhir raj on 9/6/18.
//  Copyright © 2018 Randhir raj. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {

    @IBOutlet weak var CellTitle: UILabel!
    
    @IBOutlet weak var CellDescLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
