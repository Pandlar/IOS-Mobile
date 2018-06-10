//
//  DriveFunctions.swift
//  Pandlar
//
//  Created by Macbook on 5/28/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import Foundation

class DriveFunctions{
    
static func saveDriveData(driveModel:DriveModel)
{
    DriveData.DriveModels.append(driveModel);
//    if let userData = UserDefaults.standard.data(forKey: "DriveModel"),
//        let user = try? JSONDecoder().decode(driveModel., from: userData)
//    {}
//
//
//    if let encoded = try? JSONEncoder().encode(driveModel) {
//        UserDefaults.standard.set(encoded, forKey: "DriveModel")
//    }
    
    }
    
    static func getDriveData(completionHandler: @escaping ([DriveModel]) -> ()){
        DispatchQueue.global(qos:.userInteractive).async {
         
//            DriveData.DriveModels.append(DriveModel.init(MyName:"mati", MyStartingDateTimeRukhfarht: NSDate(), MyEndingDateTimeRukhfarht: NSDate(), MyStartingAddress: "sdfsdfsdfs", MyEndingAddress: "sdfsdfsdfs", MyRole: .Fahrer, MySeatsAvailibleHinfarht: 0, MySeatsAvailibleRukhfarht: 0, MyStartingDateTimeHinfarht: NSDate(),MyEndDateTimeHinfarht: NSDate()))
//
//            DriveData.DriveModels.append(DriveModel.init(MyName:"Cristina", MyStartingDateTime: NSDate(), MyEndingDateTime: NSDate(), MyStartingAddress: "sdfsdfsdfs", MyEndingAddress: "sdfsdfsdfs", MyRole: .MitFahrer, MySeatsAvailible: "sdfsdfsdfs"))
//
//            DriveData.DriveModels.append(DriveModel.init(MyName:"yen", MyStartingDateTime: NSDate(), MyEndingDateTime: NSDate(), MyStartingAddress: "sdfsdfsdfs", MyEndingAddress: "sdfsdfsdfs", MyRole: .Fahrer, MySeatsAvailible: "sdfsdfsdfs"))
//
//            DriveData.DriveModels.append(DriveModel.init(MyName:"Anna", MyStartingDateTime: NSDate(), MyEndingDateTime: NSDate(), MyStartingAddress: "sdfsdfsdfs", MyEndingAddress: "sdfsdfsdfs", MyRole: .MitFahrer, MySeatsAvailible: "sdfsdfsdfs"))
            
            DispatchQueue.main.async {
                completionHandler(DriveData.DriveModels)
                
            }
        }
        
        
        
    }
    
    
}
