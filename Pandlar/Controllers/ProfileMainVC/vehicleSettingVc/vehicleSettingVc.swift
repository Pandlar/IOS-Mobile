//
//  vehicleSettingVc.swift
//  Pandlar
//
//  Created by Macbook on 6/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit
import Eureka

class vehicleSettingVc: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        form +++ Section("")
            <<< TextRow(){
                $0.title = "MARKE:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
            }
            
            <<< TextRow(){
                $0.title = "MODELL:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
            }
            
            <<< TextRow(){
                $0.title = "FARBE:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
            }
            <<< TextRow(){
                $0.title = "BAUJAHR:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
        }
            <<< TextRow(){
                $0.title = "KENNZEICHEN:"
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                      cell.textField.textColor = UIColor.white
                    cell.textLabel?.textColor = UIColor.white
        }
        
            <<< LabelRow(){
                $0.title = "ANZAHL SITZPLÄTZE INSGESAMT:"
                //$0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        }
            
            <<< TextRow(){
                $0.title = ""
                $0.cellStyle = .value1
                }.cellUpdate() {cell, row in
                    cell.backgroundColor = UIColor.clear
                    cell.textLabel?.textColor = UIColor.white
                      cell.textField.textColor = UIColor.white
                    cell.separatorInset = UIEdgeInsetsMake(0, cell.layoutMargins.left, 0, 0)
        }
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
