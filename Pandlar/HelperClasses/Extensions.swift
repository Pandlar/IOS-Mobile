//
//  Extensions.swift
//  Pandlar
//
//  Created by Macbook on 5/26/18.
//  Copyright © 2018 Pandlar. All rights reserved.
//

import Foundation
import UIKit

// MARK: UITextField.
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

// MARK: View.

@IBDesignable extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var viewBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var viewBorderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var viewShadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = viewShadowRadius
        }
    }
    
    
        
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
     
    
    public func swapFirstItemsOfConstraintsDefinedInThisView(_ superview: UIView, betweenItem item1: AnyObject, andItem item2: AnyObject)
    {
        var constraintsToRemove: [NSLayoutConstraint]  = []
        var constraintsNew_item1: [NSLayoutConstraint]  = []
        var constraintsNew_item2: [NSLayoutConstraint]  = []
        
        for constraint in superview.constraints
        {
            if (constraint.firstItem === item1)
            {
                constraintsToRemove.append(constraint)
                constraintsNew_item1.append(NSLayoutConstraint(item: item2, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: constraint.secondItem, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant))
            }
            else if (constraint.firstItem === item2)
            {
                constraintsToRemove.append(constraint)
                constraintsNew_item2.append(NSLayoutConstraint(item: item1, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: constraint.secondItem, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant))
            }
        }
        
        superview.removeConstraints(constraintsToRemove);
        superview.addConstraints(constraintsNew_item1);
        superview.addConstraints(constraintsNew_item2);
    }
    
}

//MARK: String

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

//MARK: AlertView
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}


//MARK: DATE
extension NSDate {
    var calendar: NSCalendar {
        return NSCalendar(identifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))!
    }
    
    func after(value: Int, calendarUnit:NSCalendar.Unit) -> NSDate{
        return calendar.date(byAdding: calendarUnit, value: value, to: self as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
    }
    
    func equalsTo(date: NSDate) -> Bool {
        return self.compare(date as Date) == ComparisonResult.orderedSame
    }
    
    func greaterThan(date: NSDate) -> Bool {
        return self.compare(date as Date as Date) == ComparisonResult.orderedDescending
    }
    
    func lessThan(date: NSDate) -> Bool {
        return self.compare(date as Date) == ComparisonResult.orderedAscending
    }
    
    class func parse(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> NSDate{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)! as NSDate
    }
    
    func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }
    
}




//MARK: TableView
@IBDesignable
class DesignableTableView: UITableView {
    
    @IBInspectable var backgroundImage: UIImage? {
        didSet {
            if let image = backgroundImage {
                let backgroundImage = UIImageView(image: image)
                backgroundImage.contentMode = UIViewContentMode.scaleToFill
                backgroundImage.clipsToBounds = false
                self.backgroundView = backgroundImage
            }
        }
    }
    
}

extension UIImageView {
    func roundCornersForAspectFit(radius: CGFloat)
    {
        if let image = self.image {
            
            //calculate drawingRect
            let boundsScale = self.bounds.size.width / self.bounds.size.height
            let imageScale = image.size.width / image.size.height
            
            var drawingRect : CGRect = self.bounds
            
            if boundsScale > imageScale {
                drawingRect.size.width =  drawingRect.size.height * imageScale
                drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
            }else {
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}


