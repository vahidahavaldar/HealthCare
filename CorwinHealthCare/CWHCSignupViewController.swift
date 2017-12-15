//
//  CWHCSignupViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 14/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCSignupViewController: UIViewController , UITableViewDataSource , UITableViewDelegate,UITextFieldDelegate {

    
    var checkedArr : NSMutableArray = ["0","0"];
    var uncheckedArr: NSMutableArray = ["0","0"];
    
    @IBOutlet weak var signupTable: UITableView!
    let placeholdersForTextFields = ["Email ID" , "Contact Number" , "Password" , "Confirm Password" , "Referral Code (Optional)"]
    let cellID = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Sign Up"
        

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationItem.title = "Sign Up"

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholdersForTextFields.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 5
        {
            let cell : CWHCSignupGenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellid1") as! CWHCSignupGenderTableViewCell
            cell.femaleBtn.addTarget(self, action: #selector(genderBtnTapped(sender:)), for: .touchUpInside)
            cell.maleBtn.addTarget(self, action: #selector(genderBtnTapped(sender:)), for: .touchUpInside)
            let s1 : NSString = checkedArr.object(at:0) as! NSString
            if s1 == "1"
            {
                cell.maleBtn.setImage(UIImage.init(named: "selected.png"), for: .normal)
                
            }
            else
            {
                cell.maleBtn .setImage(UIImage.init(named: "unselected.png"), for: .normal)

            }
            let s2 : NSString = checkedArr.object(at: 1) as! NSString
            if s2 == "1"
            {
                cell.femaleBtn.setImage(UIImage.init(named: "selected.png"), for: .normal)

            }
            else
            {
                cell.femaleBtn.setImage(UIImage.init(named: "unselected.png"), for: .normal)

            }
            return cell
        }
            
        let cell : CWHCSignupTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID)! as! CWHCSignupTableViewCell
    
        cell.dataField.placeholder = placeholdersForTextFields[indexPath.row]

        cell.dataField.delegate = self;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
    }
    
    func genderBtnTapped(sender : UIButton) -> Void
    {
       // let contentView = sender.superview
      //  let cell : CWHCSignupGenderTableViewCell = contentView?.superview as! CWHCSignupGenderTableViewCell
        
        let str : NSString = checkedArr.object(at: sender.tag) as! NSString
        if str == "0"
        {
            checkedArr.removeAllObjects()
            checkedArr.addObjects(from: uncheckedArr as! [Any])
            checkedArr.replaceObject(at: sender.tag, with: "1")
        }
        else
        {
            checkedArr.replaceObject(at: sender.tag, with: "0")
        }
        signupTable.reloadData()
        
    }
    
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func keyboardWillShow(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            signupTable.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    func keyboardWillHide(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            signupTable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
    @IBAction func createAccountTapped(_ sender: Any)
    {
        var isEmptyField = false
        let snackBar : TTGSnackbar = TTGSnackbar.init()
        for var i in 0..<4
        {
            let cellIndex = NSIndexPath.init(row: i, section: 0)

            let cell = signupTable.cellForRow(at: cellIndex as IndexPath) as! CWHCSignupTableViewCell
            if cell.dataField.text?.characters.count == 0
            {
                    isEmptyField = true
            }
            
        }
        
        if isEmptyField
        {
            snackBar.message = "Please enter all required data"
            snackBar.show()
        }
    }
}
