//
//  HomeDriveVc.swift
//  Pandlar
//
//  Created by Macbook on 5/28/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class HomeDriveVc: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var ArrayOfObjectDrives = [DriveModel]()
    
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var viewBackGround: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUI()
        /////// tableView configuration
        tableView.delegate=self
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        DriveFunctions.getDriveData {ArrayDriveObj in
            self.ArrayOfObjectDrives = ArrayDriveObj
            self.tableView.reloadData()
            
           
        }
    }

    func setUI(){
        /////settingUp tableview cell
        tableView.register(UINib(nibName: "MitFahrerCell", bundle: nil), forCellReuseIdentifier: "MitFahrerCell")
        tableView.register(UINib(nibName: "FahrerCell", bundle: nil), forCellReuseIdentifier: "FahrerCell")
        
        let titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.segmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.segmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        
        viewBackGround.frame = self.tableView.frame
        self.tableView.isOpaque = false;
        self.tableView.backgroundView = viewBackGround;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
      // MARK: Action
    
    
    @IBAction func btnJetztPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    
    
   // MARK: tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ArrayOfObjectDrives.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.tableView.backgroundView?.isHidden = true;
        let role : roleOfUser =  ArrayOfObjectDrives[indexPath.row].role!
        
        switch role {
        case .Fahrer:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FahrerCell", for: indexPath) as! FahrerCell
            cell.imageViewFahrer?.image = SharedManger.sharedInstance.getProfileImage()
            return cell
        case .MitFahrer:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "MitFahrerCell", for: indexPath) as! MitFahrerCell
            cell.lblName.text =  ArrayOfObjectDrives[indexPath.row].name
            cell.imageViewOfMitFahrer?.image = SharedManger.sharedInstance.getProfileImage()
            return cell
        case .Beides:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FahrerCell", for: indexPath) as! FahrerCell
            cell.imageViewFahrer?.image = SharedManger.sharedInstance.getProfileImage()
            return cell
        }
        
        return UITableViewCell()
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
