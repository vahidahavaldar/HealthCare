//
//  CWHCSignupGenderTableViewCell.swift
//  CorwinHealthCare
//
//  Created by Mac on 15/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCSignupGenderTableViewCell: UITableViewCell {

    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    var selectedFlag = false
    
    override func awakeFromNib() {
        
      
        super.awakeFromNib()
        // Initialization code
        femaleBtn.tag = 1;
        maleBtn.tag = 0;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
