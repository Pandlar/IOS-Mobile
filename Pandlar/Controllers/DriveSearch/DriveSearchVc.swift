 //
//  DriveSearchVc.swift
//  Pandlar
//
//  Created by Macbook on 5/14/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

 extension UIView {
    
    public func addConstaintsToSuperview(leftOffset: CGFloat, topOffset: CGFloat) {
        
        guard superview != nil else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.superview,
                           attribute: .leading,
                           multiplier: 1,
                           constant: leftOffset).isActive = true
        
        NSLayoutConstraint(item: self,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.superview,
                           attribute: .top,
                           multiplier: 1,
                           constant: topOffset).isActive = true
    }
    
    public func addConstaintsWithSize(height: CGFloat, width: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: height).isActive = true
        
        
        NSLayoutConstraint(item: self,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: width).isActive = true
    }
 }

 
 
 class DriveSearchVc: UIViewController,UITextFieldDelegate {
    
    
   //let toolBar = UIToolbar()
    var datePicker: UIDatePicker = UIDatePicker()
    
    @IBOutlet var btnSwitchNurHinFahrt: UISwitch!
    
    @IBOutlet var viewRukhfarht: UIView?
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var viewSeatsNo: UIView!
    
    @IBOutlet var frühesteAbfahrtHinfahrtTextField: UITextField!
    
    @IBOutlet var SpätesteAbfahrtHinFahrtTextField: UITextField!
    
    @IBOutlet var fruhesteAbfahrtRuckfahrtTextField: UITextField!
    
    @IBOutlet var spatesteAnkunftRuckfahrtTextField: UITextField!
    
    @IBOutlet var lblSeatsAvailable: UILabel!
    
    
    @IBOutlet var lblSeatsAvailaibleForRukhFahrt: UILabel!
    
    var currentSeats: NSInteger? = 4
    
    var currentSeatsAvailaibleForRukhFahrt: NSInteger? = 4
    
    
    var currentTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUI() -> ()
    {
    //lblSeatsAvailable.text? = String(currentSeats!)
    }
    
    

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
        dateFormatter.dateFormat = "hh:mm a"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        print("Selected value \(selectedDate)")
    }

    
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .none
        dateFormatter1.timeStyle = .short
         currentTextField.text = dateFormatter1.string(from: datePicker.date)
        currentTextField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        currentTextField.resignFirstResponder()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField=textField
        self.createAlertView(textField)
    }

// MARK:pickerview

//////IBActions

    @IBAction func btnWieterPressed(_ sender: Any) {
    
      
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
        self.performSegue(withIdentifier: "driveToConfirm", sender: nil)
        
    }
    
    
    
    
    @IBAction func segmentControlPressed(_ sender: Any)
    {
        switch segmentControl.selectedSegmentIndex {
        case 0:
             viewSeatsNo.isHidden=true
        case 1:
            viewSeatsNo.isHidden=false
        case 2:
            viewSeatsNo.isHidden=false
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
    }
        
   
    @IBAction func btnMinusSeatsPressed(_ sender: Any)
    {
        
        if currentSeats!<2 {
            return
        }
        currentSeats = currentSeats!-1
        lblSeatsAvailable.text? = String(currentSeats!)
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
    
    
    
    
    
   ///
   
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "DriveToDriveSummary" {
            let controller = segue.destination as! DriveSearchSummaryVc
                controller.driveDataDic = ["":""]
            
        }
     }
      
    
 }
    


