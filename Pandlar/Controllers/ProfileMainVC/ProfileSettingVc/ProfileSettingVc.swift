//
//  ProfileSettingVc.swift
//  Pandlar
//
//  Created by Macbook on 6/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit
import Eureka

class ProfileSettingVc: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
            form +++ Section("")
                
          
            
            <<< TextRow(){
                $0.title = "HANDYNUMMER:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
                    cell.textField.textColor = UIColor.white
                    //cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
       
                <<< TextRow(){
                    $0.title = "NAME:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
        
                
                
                <<< TextRow(){
                    $0.title = "VORNAME:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
         
                
                <<< TextRow(){
                    $0.title = "WOHNORT \nSTRAßE,HAUSNUMMER:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.textLabel?.numberOfLines=0
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
        
                
                <<< TextRow(){
                    $0.title = "TREFFPUNKT:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
        
                <<< TextRow(){
                    $0.title = "ARBIETSORT \nSTRAßE,HAUSNUMMER:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.textLabel?.numberOfLines=0
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
        
                
                <<< TextRow(){
                    $0.title = "POSTLEITZAHL STADT:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
        
    
                
                <<< TextRow(){
                    $0.title = "TREFFPUNKT:"
                    $0.cellStyle = .value1
                    }.cellUpdate() {cell, row in
                        cell.backgroundColor = UIColor.clear
                        cell.textLabel?.textColor = UIColor.white
                          cell.textField.textColor = UIColor.white
                        cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
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
