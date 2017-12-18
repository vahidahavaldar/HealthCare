//
//  CWHCHomeViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 14/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCHomeViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var productsTable: UITableView!
    @IBOutlet weak var productCategoryTF: APJTextPickerView!
    fileprivate var strings = ["Rome", "Madrid", "Tokyo", "Rio de Janeiro", "Moscow", "Shanghai"]
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
        
        
        productCategoryTF.type = .strings
        productCategoryTF.pickerDelegate = self
        productCategoryTF.dataSource = self
        productCategoryTF.tintColor = UIColor.red
        
        productsTable.dataSource = self
        productsTable.delegate = self
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
    
    //MARK : - Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : CWHCProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier:"productCellId") as! CWHCProductsTableViewCell
        
        cell.addBtn.addTarget(self, action: #selector(addToCartTapped(sender:)), for:UIControlEvents.touchUpInside)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    @objc private func addToCartTapped(sender : UIButton)
    {
        
    }
    
}
extension CWHCHomeViewController: APJTextPickerViewDelegate {
    func textPickerView(_ textPickerView: APJTextPickerView, didSelectDate date: Date)
    {
        print("Date Selected: \(date)")
    }
    
    func textPickerView(_ textPickerView: APJTextPickerView, didSelectString row: Int)
    {
        print("City Selected: \(strings[row])")
    }
    
    func textPickerView(_ textPickerView: APJTextPickerView, titleForRow row: Int) -> String?
    {
        return strings[row]
    }
}

extension CWHCHomeViewController: APJTextPickerViewDataSource
{
    func numberOfRows(in pickerView: APJTextPickerView) -> Int
    {
        return strings.count
    }
}
