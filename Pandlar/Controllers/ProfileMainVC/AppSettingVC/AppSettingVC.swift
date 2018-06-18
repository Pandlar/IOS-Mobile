//
//  AppSettingVC.swift
//  Pandlar
//
//  Created by Macbook on 6/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit
import Eureka

class AppSettingVC: FormViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        form +++ Section("")
            <<< SwitchRow(){
                $0.title = "PUSH- BENACHRICHTIGUNGEN"
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    
                    cell.textLabel?.textColor = UIColor.white
                }
            
            
            <<< SwitchRow(){
                $0.title = "EMAIL NOTIFICATIONS"
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    
                    cell.textLabel?.textColor = UIColor.white
            }
            
            <<< TextRow(){
                $0.title = "PASSWORT"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
                }
           
            
            <<< ButtonRow(){
                $0.title = "BEZAHLUNG"
                $0.cellStyle  = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
            }
            <<< ButtonRow(){
                $0.title = "HILFE"
                $0.cellStyle  = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
            }
            <<< ButtonRow(){
                $0.title = "AGBs"
                $0.cellStyle  = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
            }
            <<< ButtonRow(){
                $0.title = "FAQs"
                $0.cellStyle  = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
        }
            
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
