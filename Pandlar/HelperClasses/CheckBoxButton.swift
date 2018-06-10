//
//  CheckBoxButton.swift
//  Pandlar
//
//  Created by Macbook on 5/26/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {

    let checkedImage = UIImage(named: "CheckedBoxImage")! as UIImage
    let uncheckedImage = UIImage(named: "CheckedBoxSelectedImage")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
