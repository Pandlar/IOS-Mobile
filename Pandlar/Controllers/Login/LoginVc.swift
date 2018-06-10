//
//  LoginVcViewController.swift
//  Pandlar
//
//  Created by Macbook on 5/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit




class LoginVc: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var avoidingview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    
    override func viewDidLayoutSubviews() {
       self.setUI()
    }
    
    func setUI() -> (){
        // Do any additional UI setup after loading the view.
        txtName.setBottomLine(borderColor: .gray)
        txtPassword.setBottomLine(borderColor: .gray)
        txtName.setRightPaddingPoints(15);
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
