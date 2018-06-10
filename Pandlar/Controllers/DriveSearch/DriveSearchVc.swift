 //
 //  DriveSearchVc.swift
 //  Pandlar
 //
 //  Created by Macbook on 5/14/18.
 //  Copyright © 2018 Pandlar. All rights reserved.
 //
 
 import UIKit
 class DriveSearchVc: UIViewController,UITextFieldDelegate {
    // MARK:properties
    var datePicker: UIDatePicker = UIDatePicker()
    
    @IBOutlet var btnSwitchNurHinFahrt: UISwitch!
    
    @IBOutlet var viewRukhfarht: UIView?
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var viewSeatsNo: UIView!
    
    @IBOutlet var viewSeatRukhFahrtNo: UIView!
    
    @IBOutlet var textFieldfrühesteAbfahrtHinfahrt: UITextField!
    
    @IBOutlet var textFieldSpätesteAbfahrtHinFahrt: UITextField!
    
    @IBOutlet var textFieldfruhesteAbfahrtRuckfahrt: UITextField!
    
    @IBOutlet var textFieldspatesteAnkunftRuckfahrt: UITextField!
    
    @IBOutlet var lblSeatsAvailable: UILabel!
    
    @IBOutlet var lblSeatsAvailaibleForRukhFahrt: UILabel!
    
    @IBOutlet var imageViewHinFahrtZuhause: UIImageView!
    
    @IBOutlet var imageViewHinFahrtArbeit: UIImageView!
    
    var currentSeats: NSInteger? = 1
    
    var currentSeatsAvailaibleForRukhFahrt: NSInteger? = 1
    
    var currentTextField : UITextField!
    
    var  role:roleOfUser = .MitFahrer
    
    var driveObj = DriveModel()
    
     var dictForDriveTimes = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        driveObj = DriveModel()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUI() -> ()
    {
        let titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.segmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        //self.segmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
}
    
    
  
   
    
    // MARK:IBActions
    
    //////IBActions
    // MARK:Exit 1
    @IBAction func btnWieterHinfahrtPressed(_ sender: Any) {
        if (validateUserEntry() == nil) {
            self.showAlert(title:"Sorry", message:"Please select desired time before moving forward")
            return
        }
        if btnSwitchNurHinFahrt.isOn{
            self.performSegue(withIdentifier: "DriveToDriveSummary", sender: nil)
        }
        else{
            self.view.addSubview(viewRukhfarht!)
            self.view.bringSubview(toFront:(viewRukhfarht)!)
            viewRukhfarht?.addConstaintsToSuperview(leftOffset: 0, topOffset: 0)
            viewRukhfarht?.addConstaintsWithSize(height: self.view.frame.height, width: self.view.frame.width)
        }
    }
    
    
    @IBAction func viewRukhfarhtRemovePressed(_ sender: Any) {
        viewRukhfarht?.removeFromSuperview()
    }
    
    
    @IBAction func btnRukhFarhtPressed(_ sender: Any) {
        let dictDriveSearchData = validateUserEntry()
        if (dictDriveSearchData == nil) {
            self.showAlert(title:"Sorry", message:"Please select desired time before moving forward")
            return
        }
        self.performSegue(withIdentifier: "DriveToDriveSummary", sender: nil)
    }
    
    @IBAction func segmentControlPressed(_ sender: Any)
    {
        switch segmentControl.selectedSegmentIndex {
        case 0:do {
            self.viewSeatsNo.isHidden=true
            viewSeatRukhFahrtNo.isHidden = true
            role = .MitFahrer
            }
        case 1:
            do {
                viewSeatsNo.isHidden=false
                viewSeatRukhFahrtNo.isHidden = false
                role = .Fahrer
                }
        case 2:
            do {
                viewSeatsNo.isHidden=false
                role = .Beides
                viewSeatRukhFahrtNo.isHidden = true
            }
        default:
            break;
        }
        }
    
    
    
    @IBAction func btnPlusSeatPressed(_ sender: Any)
    {
        if currentSeats!>3 {
            return
        }
        currentSeats = currentSeats!+1
        lblSeatsAvailable.text? = String(currentSeats!)
        driveObj.seatsAvailibleHinfarht = currentSeats!
    }
    
    
    @IBAction func btnMinusSeatsPressed(_ sender: Any)
    {
        if currentSeats!<2 {
            return
        }
        currentSeats = currentSeats!-1
        lblSeatsAvailable.text? = String(currentSeats!)
        driveObj.seatsAvailibleHinfarht = currentSeats!
    }
    
    
    @IBAction func btnMinusRukhFarhtPressed(_ sender: Any)
    {
        if currentSeatsAvailaibleForRukhFahrt!<2 {
            return
        }
        currentSeatsAvailaibleForRukhFahrt = currentSeatsAvailaibleForRukhFahrt!-1
        lblSeatsAvailaibleForRukhFahrt.text? = String(currentSeatsAvailaibleForRukhFahrt!)
    }
    
    
    @IBAction func btnPlusRukhFarhtPressed(_ sender: Any)
    {
        if currentSeatsAvailaibleForRukhFahrt!>3 {
            return
        }
        currentSeatsAvailaibleForRukhFahrt = currentSeatsAvailaibleForRukhFahrt!+1
        lblSeatsAvailaibleForRukhFahrt.text? = String(currentSeatsAvailaibleForRukhFahrt!)
    }
    
    
    @IBAction func btnSwitchStartLocationPressed(_ sender: Any) {
        
        //let uiview: UIView = self.view.viewWithTag(120)!
        //self.view.swapFirstItemsOfConstraintsDefinedInThisView(uiview, betweenItem: imageViewHinFahrtArbeit, andItem: imageViewHinFahrtZuhause)
        self.view.layoutIfNeeded()
    }
    
    
    
    // MARK:helpingFunction
    
    func validateUserEntry() -> ([String:Any]?) {
        // theTextField.text!.isEmpty
        guard textFieldfrühesteAbfahrtHinfahrt.text.nilIfEmpty != nil else {
            return nil
        }
        
        guard textFieldSpätesteAbfahrtHinFahrt.text.nilIfEmpty != nil else  {
            return nil
        }
        /////// adding non empty value in dictionary to return
        dictForDriveTimes["frühesteAbfahrtHinfahrt"] = textFieldfrühesteAbfahrtHinfahrt.text!
        dictForDriveTimes["SpätesteAbfahrtHinFahrt"] = textFieldSpätesteAbfahrtHinFahrt.text!
        
       if (self.viewRukhfarht?.isDescendant(of: self.view))!{
            guard textFieldfruhesteAbfahrtRuckfahrt.text.nilIfEmpty != nil else  {
                return nil
            }
            
            guard textFieldspatesteAnkunftRuckfahrt.text.nilIfEmpty != nil else {
                return nil
            }
            dictForDriveTimes["fruhesteAbfahrtRuckfahrt"] = textFieldfruhesteAbfahrtRuckfahrt.text!
            dictForDriveTimes["spatesteAnkunftRuckfahrt"] = textFieldspatesteAnkunftRuckfahrt.text!
    
        }
        return dictForDriveTimes
        
    }
    
    
    ///
    
    // MARK: - Navigation
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "DriveToDriveSummary" {
            let controller = segue.destination as! DriveSearchSummaryVc
            driveObj.role = role;
            controller.driveDetailObj = driveObj
            controller.isNurHinFahrt = btnSwitchNurHinFahrt.isOn
        }
    }
    
    // MARK:pickerview
    func createAlertView(_ textField : UITextField) {
        // Create a DatePicker
        // Posiiton date picket within a view
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    ////////
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "hh:mm AA"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        print("Selected value \(selectedDate)")
    }
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .none
        dateFormatter1.timeStyle = .short
        currentTextField.text = dateFormatter1.string(from: datePicker.date)+" Uhr"
        currentTextField.resignFirstResponder()
        collectDateFromDatePicker(currentTextField: currentTextField)
    }
    
    
    
    func collectDateFromDatePicker(currentTextField:(UITextField)) -> () {
        switch currentTextField {
        case textFieldfrühesteAbfahrtHinfahrt :
            do{
                driveObj.startingDateTimeHinfarht = datePicker.date as NSDate
            }
            break
        case textFieldSpätesteAbfahrtHinFahrt :
            do{
                driveObj.endingDateTimeHinfarht = datePicker.date as NSDate
                }
        case textFieldfruhesteAbfahrtRuckfahrt :
            do{
                driveObj.startingDateTimeRukhfarht = datePicker.date as NSDate
            }
        case textFieldspatesteAnkunftRuckfahrt :
            do{
                driveObj.endingDateTimeRukhfarht = datePicker.date as NSDate
            }
        default: break
            
        }
        
    }
    
    
    @objc func cancelClick() {
        currentTextField.resignFirstResponder()
    }
    //MARK: textField
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField=textField
        self.createAlertView(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
       
    }
    
 }
 
 
 
 

