//
//  HomeModel.swift
//  Pandlar
//
//  Created by Macbook on 5/28/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import Foundation

class HomeDriveModel
{
    var name:String
    var startingDateTime:String?
    var endingDateTime:String?
    var startingAddress:String?
    var endingAddress:String?
    var role:String?
    var seatsAvailible:String?
    
    init(MyName:String,MyStartingDateTime:String,MyEndingDateTime:String,MyStartingAddress:String,MyEndingAddress:String,MyRole:String,MySeatsAvailible:String){
        name=MyName
        startingDateTime=MyStartingDateTime
        endingDateTime=MyEndingDateTime
        startingAddress=MyStartingAddress
        endingAddress=MyEndingAddress
        role=MyRole
        seatsAvailible=MySeatsAvailible
    }
}
