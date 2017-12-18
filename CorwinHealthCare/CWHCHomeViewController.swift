//
//  CWHCHomeViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 14/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCHomeViewController: UIViewController {

   
    //
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    // Initialize Tab Bar Item
    let unselectedColor = UIColor(red: 130.0/255.0, green: 127.0/255.0, blue: 130.0/255.0, alpha: 1.0)
    let selectedColor = UIColor(red: 244.0/255.0, green: 62.0/255.0, blue: 56.0/255.0, alpha: 1.0)
    let originalImg = UIImage(named: "Shopping-Cart-9")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    let coloredImg = GenericUtilities.imageWithColor(color1: selectedColor, original: originalImg!)
    tabBarItem = UITabBarItem(title: "Home", image: coloredImg, tag: 1)
    tabBarItem.badgeValue = "0"
   
    
    UITabBar.appearance().tintColor = selectedColor
    UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: unselectedColor], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], for: .selected)
    UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)], for: .selected)
}

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
