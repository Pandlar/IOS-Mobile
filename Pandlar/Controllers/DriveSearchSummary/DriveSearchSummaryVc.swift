//
//  DriveSearchSummaryVc.swift
//  Pandlar
//
//  Created by Macbook on 5/23/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class DriveSearchSummaryVc: UIViewController {

    ////Dictionary for getting data from previous class
    //var DictDriveData = [String: Any]()
    
    var driveDetailObj : DriveModel?
    
    var isNurHinFahrt : Bool = true
    
    @IBOutlet var viewHinFahrt: UIView!
    
    @IBOutlet var viewRukhFahrt: UIView!
    
    @IBOutlet var lblHinFahrtFruhestens: UILabel!
    
    @IBOutlet var lblHinFahrtSpatestens: UILabel!
    
    @IBOutlet var lblHinFahrtSitzPlatze: UILabel!
    
    @IBOutlet var lblRukhFahrtFruhestens: UILabel!
    
    @IBOutlet var lblRukhFahrtSpartestens: UILabel!
    
    @IBOutlet var lblRukhFahrtSitzPlatze: UILabel!
    
    @IBOutlet var viewSitzPlatzHinfahrt: UIView!
    
    @IBOutlet var viewSitzPlatzRukhfahrt: UIView!
    
    @IBOutlet var viewCompletionOfDrive: UIView!
    
    @IBOutlet var lblRole: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }

    func setUI() -> ()
    {
      ////////hiding view in case of one sided drive
         viewRukhFahrt.isHidden = false
        if isNurHinFahrt==true {
           viewRukhFahrt.isHidden = true
        }
        
        
        
        ////// hiding seats views in case of mitfahrer
        if(driveDetailObj?.role == roleOfUser.MitFahrer)
        {
            viewSitzPlatzHinfahrt.isHidden = true
            viewSitzPlatzRukhfahrt.isHidden =  true
        }
        ///////Adding text to label
        
        lblHinFahrtFruhestens.text=(driveDetailObj?.startingDateTimeHinfarht?.toString(format: "HH:mm"))! + "Uhr"
        lblHinFahrtSpatestens.text=(driveDetailObj?.endingDateTimeHinfarht?.toString(format: "HH:mm"))! + "Uhr"
        lblRukhFahrtFruhestens.text=(driveDetailObj?.startingDateTimeRukhfarht?.toString(format: "HH:mm"))! + "Uhr"
        lblRukhFahrtSpartestens.text = (driveDetailObj?.endingDateTimeHinfarht?.toString(format: "HH:mm"))! + "Uhr"
        lblRole.text =   "Du bist "+(driveDetailObj?.role?.rawValue)!
        lblHinFahrtSitzPlatze.text =  String(driveDetailObj!.seatsAvailibleHinfarht)
    lblRukhFahrtSitzPlatze.text = String(driveDetailObj!.seatsAvailibleRukhfarht)
        
        
        }
    
 // MARK: - IBOutlet
    @IBAction func btnBestätigenPressed(_ sender: Any) {
        driveDetailObj?.name = "Yen Luu"
        DriveFunctions.saveDriveData(driveModel: driveDetailObj!)
        UIApplication.shared.keyWindow?.addSubview(viewCompletionOfDrive)
        viewCompletionOfDrive.tag = 1000
       viewCompletionOfDrive .addConstaintsToSuperview(leftOffset: 0, topOffset: 0)
        viewCompletionOfDrive.addConstaintsWithSize(height: self.view.frame.height, width: self.view.frame.width)
        self.tabBarController?.tabBar.isHidden = true
        }
    
    
    @IBAction func btnOKPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
        self.tabBarController?.tabBar.isHidden = false
         UIApplication.shared.keyWindow?.viewWithTag(1000)?.removeFromSuperview()
         self.navigationController?.popToRootViewController(animated:true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
