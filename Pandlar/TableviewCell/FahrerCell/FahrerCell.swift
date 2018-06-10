//
//  FahrerCell.swift
//  Pandlar
//
//  Created by Macbook on 5/30/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class FahrerCell: UITableViewCell {

    @IBOutlet var lblRoleOfRider: UILabel!
    @IBOutlet var lblDateAndTime: UILabel!
    @IBOutlet var lblStartingPoint: UILabel!
    @IBOutlet var lblSeatAvailable: UILabel!
    @IBOutlet var lblEndingPoint: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
