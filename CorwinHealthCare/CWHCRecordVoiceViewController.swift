//
//  CWHCRecordVoiceViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 16/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCRecordVoiceViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        
       // let selectedColor = UIColor(red: 244.0/255.0, green: 62.0/255.0, blue: 56.0/255.0, alpha: 1.0)
        
        let originalImg = UIImage(named: "HC_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        tabBarItem = UITabBarItem(title: "Record", image: UIImage.init(named: "HC_unselected")?.withRenderingMode(UIImageRenderingMode
            .alwaysOriginal), tag: 2)
        
        tabBarItem.image = originalImg
        tabBarItem.selectedImage = UIImage.init(named: "HC_voice_recording")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
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
