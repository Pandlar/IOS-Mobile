//
//  SharedManger.swift
//  Pandlar
//
//  Created by Macbook on 6/12/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import Foundation
import UIKit

final class SharedManger{
    static let sharedInstance = SharedManger()
    private init() {}

func saveProfileImage(image : UIImage) -> () {
    UserDefaults.standard.set(UIImagePNGRepresentation(image), forKey: "kKeyImage")

}
    func getProfileImage() -> (UIImage?) {
        
        if let imageData = UserDefaults.standard.object(forKey: "kKeyImage"),
            let image = UIImage(data: (imageData as! NSData) as Data){
            return image
        }
        return nil
    }

}


