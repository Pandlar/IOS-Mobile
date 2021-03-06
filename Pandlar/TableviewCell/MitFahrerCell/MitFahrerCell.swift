//
//  MitFahrerCell.swift
//  Pandlar
//
//  Created by Macbook on 5/29/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class MitFahrerCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var lblRoleOfRider: UILabel!
    
    
    @IBOutlet var lblDateAndTime: UILabel!
    
    @IBOutlet var lblStartingPoint: UILabel!
    
    @IBOutlet var imageViewOfMitFahrer: UIImageView?
    @IBOutlet var lblSeatAvailable: UILabel!
    @IBOutlet var lblEndingPoint: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         imageViewOfMitFahrer?.layer.cornerRadius = (imageViewOfMitFahrer?.frame.width)!/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
