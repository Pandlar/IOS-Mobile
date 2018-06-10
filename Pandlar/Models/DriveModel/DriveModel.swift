//
//  HomeModel.swift
//  Pandlar
//
//  Created by Macbook on 5/28/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import Foundation

enum roleOfUser: String {
    case Fahrer = "Fahrer"
    case MitFahrer = "MitFahrer"
    case Beides = "Beides"
}

class DriveModel 
{
    var name:String
    var startingDateTimeRukhfarht:NSDate?
    var endingDateTimeRukhfarht:NSDate?
    var startingDateTimeHinfarht:NSDate?
    var endingDateTimeHinfarht:NSDate?
    var startingAddress:String?
    var endingAddress:String?
    var role:roleOfUser?
    var seatsAvailibleHinfarht:Int
    var seatsAvailibleRukhfarht:Int
    init(MyName:String,MyStartingDateTimeRukhfarht:NSDate,MyEndingDateTimeRukhfarht:NSDate,MyStartingAddress:String,MyEndingAddress:String,MyRole:roleOfUser,MySeatsAvailibleHinfarht:Int,MySeatsAvailibleRukhfarht:Int,MyStartingDateTimeHinfarht:NSDate,MyEndDateTimeHinfarht:NSDate){
        name=MyName
        
        startingDateTimeRukhfarht=MyStartingDateTimeRukhfarht
        endingDateTimeRukhfarht=MyEndingDateTimeRukhfarht
        startingAddress=MyStartingAddress
        endingAddress=MyEndingAddress
        role=MyRole
        seatsAvailibleHinfarht = MySeatsAvailibleHinfarht
        seatsAvailibleRukhfarht = MySeatsAvailibleRukhfarht
        
        startingDateTimeHinfarht=MyStartingDateTimeHinfarht
        endingDateTimeHinfarht=MyEndDateTimeHinfarht
        
       
    }
    
    init()
    {
        name=""
        startingDateTimeRukhfarht = NSDate()
        endingDateTimeRukhfarht = NSDate()
        startingAddress = ""
        endingAddress  = ""
        role = roleOfUser.Fahrer
        seatsAvailibleHinfarht = 0
        seatsAvailibleRukhfarht = 0
        startingDateTimeHinfarht = NSDate()
        endingDateTimeHinfarht = NSDate()
        
    }
}
