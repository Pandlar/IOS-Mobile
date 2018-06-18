//
//  ProfileVcViewController.swift
//  Pandlar
//
//  Created by Macbook on 6/10/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit
import ImagePicker





class ProfileMainVC: UIViewController,ImagePickerDelegate {

    
    @IBOutlet var btnProfile: UIButton!
    
    @IBOutlet var btnVehicle: UIButton!
    
    @IBOutlet var btnSetting: UIButton!
    
    @IBOutlet var btnCamera: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUI()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var boundView: UIView!
    
    func SetUI() -> () {
        remove(asChildViewController: ProfileSettingVc)
        remove(asChildViewController: vehicleSettingVc)
        add(asChildViewController: AppSettingVC)
        btnProfile.isSelected = true
        //////
        btnCamera.imageView?.roundCornersForAspectFit(radius: btnCamera.frame.size.width/2)
        btnCamera.cornerRadius = btnCamera.frame.width/2
        btnCamera.imageView?.layer.masksToBounds = false
        btnCamera.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
        
       public lazy var ProfileSettingVc: ProfileSettingVc = {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            // Instantiate View Controller
            var viewController = storyboard.instantiateViewController(withIdentifier: "ProfileSettingVc") as! ProfileSettingVc
            
            // Add View Controller as Child View Controller
            self.add(asChildViewController: viewController)
            
            return viewController
        }()
        
      public lazy var AppSettingVC: AppSettingVC = {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            // Instantiate View Controller
            var viewController = storyboard.instantiateViewController(withIdentifier: "AppSettingVC") as! AppSettingVC
            
            // Add View Controller as Child View Controller
            self.add(asChildViewController: viewController)
            
            return viewController
        }()
        
        
        public lazy var vehicleSettingVc: vehicleSettingVc = {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            // Instantiate View Controller
            var viewController = storyboard.instantiateViewController(withIdentifier: "vehicleSettingVc") as! vehicleSettingVc
            
            // Add View Controller as Child View Controller
            self.add(asChildViewController: viewController)
            
            return viewController
        }()
        
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
     
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = boundView.frame
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - IBActions
    
    @IBAction func btnCameraPressed(_ sender: Any) {
        let imagePickerController = ImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.imageLimit = 1
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func btnProfilePressed(_ sender: UIButton) {
        selectButton(sender: sender )
        remove(asChildViewController: vehicleSettingVc)
        remove(asChildViewController: AppSettingVC)
        add(asChildViewController:ProfileSettingVc)
        
       
        
        
    }
    
    @IBAction func btnVehiclePressed(_ sender: UIButton) {
        selectButton(sender: sender)
        remove(asChildViewController: ProfileSettingVc)
        remove(asChildViewController: AppSettingVC)
        add(asChildViewController:vehicleSettingVc )
    }
    
    @IBAction func btnUserSetting(_ sender: UIButton) {
        selectButton(sender: sender)
        remove(asChildViewController: ProfileSettingVc)
        remove(asChildViewController: vehicleSettingVc)
        add(asChildViewController: AppSettingVC)
    }
    
     // MARK: - imageController
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
    }
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]){
        
        let image = images[0]
        
        btnCamera.setImage(nil, for: .normal)
        btnCamera.setBackgroundImage(image, for: .normal)
       SharedManger.sharedInstance.saveProfileImage(image: images[0])
        imagePicker .dismiss(animated: true) {}
        self.view.layoutIfNeeded()
    }
    func cancelButtonDidPress(_ imagePicker: ImagePickerController){
        imagePicker .dismiss(animated: true) {}
    }
 
     // MARK: - helpingFunction
    
    
    
    func selectButton(sender: UIButton) -> () {
        
        btnProfile.isSelected = false
        btnVehicle.isSelected = false
        btnSetting.isSelected = false
        sender.isSelected=true
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
