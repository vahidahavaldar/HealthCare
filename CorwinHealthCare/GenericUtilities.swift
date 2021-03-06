//
//  GenericUtilities.swift
//  CorwinHealthCare
//
//  Created by Mac on 15/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class GenericUtilities: NSObject
{
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // Move the text field in a pretty animation!
    class func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool, toView : UIView) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        toView.frame = toView.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }

    //email validation
   class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    //recolor image
    class func imageWithColor(color1: UIColor , original : UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(original.size, false, original.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: original.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        
        let rect = CGRect(x: 0, y: 0, width: original.size.width,height : original.size.height)
       // let rect = CGRectMake(0, 0, original.size.width, original.size.height) as CGRect
        context.clip(to: rect, mask: original.cgImage!)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
