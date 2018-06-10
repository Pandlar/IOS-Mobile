//
//  IntroVc.swift
//  Pandlar
//
//  Created by Macbook on 5/11/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import UIKit

class IntroVc: UIViewController ,UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var btnPushToLogin: UIButton!
    
     var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.setUI()
    }
    
    override func viewDidLayoutSubviews() {
        self.setUI()
    }
    
    
    func setUI() -> ()
 {
     
images=[UIImage(named:"intro1")!,UIImage(named:"intro2")!,UIImage(named:"intro3")!,UIImage(named:"intro4")!,UIImage(named:"intro5")!];
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            imageView.contentMode = .scaleAspectFit
            imageView.image = images[i]
            scrollView.isPagingEnabled=true
            scrollView.delegate=self
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: scrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        btnPushToLogin.alpha=0.0
        if (scrollView.contentOffset.x >= (scrollView.contentSize.width - scrollView.frame.size.width)) {
            //reach bottom
            self.view.bringSubview(toFront: btnPushToLogin);
            btnPushToLogin.alpha=1.0
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
       
        // Call your function here
       
        //NSObject.cancelPreviousPerformRequests(withTarget: self)
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
