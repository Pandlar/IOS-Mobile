//
//  LoginVcViewController.swift
//  Pandlar
//
//  Created by Macbook on 5/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

extension UITextField {
    //////TextField extention for making line in bottom
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }

}


class LoginVcViewController: UIViewController {

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
        txtName.setBottomLine(borderColor: .green)
        txtPassword.setBottomLine(borderColor: .green)
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
