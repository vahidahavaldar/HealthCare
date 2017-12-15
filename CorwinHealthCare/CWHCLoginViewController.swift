//
//  CWHCLoginViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 14/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCLoginViewController: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.backgroundColor = GenericUtilities.hexStringToUIColor(hex:"#F43E38")
        self.navigationController?.navigationBar.barTintColor = GenericUtilities.hexStringToUIColor(hex:"#F43E38")
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationItem.title = "Log In"
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = GenericUtilities.hexStringToUIColor(hex:"#F43E38")
        self.view.addSubview(barView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = false

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
    GenericUtilities.moveTextField(textField , moveDistance: -150, up: true, toView: self.view)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        GenericUtilities.moveTextField(textField , moveDistance: -150, up: false, toView: self.view)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    
}
