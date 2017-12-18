//
//  CWHCTabBarViewController.swift
//  CorwinHealthCare
//
//  Created by Mac on 16/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCTabBarViewController: UITabBarController , UIAdaptivePresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        
        //UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"//   style:UIBarButtonSystemItemDone target:nil action:nil];
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "hc_seetings"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(openMenu(sender:)), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton;
       // self.navigationItem.rightBarButtonItem?.target = self
       // self.navigationItem.rightBarButtonItem?.action = #selector(openMenu(sender:))
    }
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , the default value is 49 px, below lowers the tabbar and above increases the tab bar size
        tabFrame.size.height = 80
        tabFrame.origin.y = self.view.frame.size.height - 80
        self.tabBar.frame = tabFrame
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

    
    //popover menu
    public func openMenu(sender:UIButton) {
        let titles:NSArray = ["Menu1", "Menu2", "Menu3"]
        let descriptions:NSArray = ["description1", "description2", "description3"]
        
        let popOverViewController = PopOverViewController.instantiate()
        popOverViewController.setTitles(titles as! Array<String>)
        popOverViewController.setDescriptions(descriptions as! Array<String>)
        
        // option parameteres
        // popOverViewController.setSelectRow(1)
        // popOverViewController.setShowsVerticalScrollIndicator(true)
        // popOverViewController.setSeparatorStyle(UITableViewCellSeparatorStyle.singleLine)
        
        popOverViewController.popoverPresentationController?.sourceView = sender
        popOverViewController.popoverPresentationController?.popoverLayoutMargins.top = 40
        popOverViewController.preferredContentSize = CGSize(width: 300, height:135)
        popOverViewController.presentationController?.delegate = self
        popOverViewController.completionHandler = { selectRow in
            switch (selectRow) {
            case 0:
                break
            case 1:
                break
            case 2:
                break
            default:
                break
            }
            
        };
        present(popOverViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
