//
//  ParkTableViewCell.swift
//  SlapsNYC
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ParkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberOfCourtsLabel: UILabel!
    
    @IBOutlet weak var parkNameLabel: UILabel!
    
    @IBOutlet weak var parkAddressLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
