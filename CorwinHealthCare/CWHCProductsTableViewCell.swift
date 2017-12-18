//
//  CWHCProductsTableViewCell.swift
//  CorwinHealthCare
//
//  Created by Mac on 18/12/17.
//  Copyright © 2017 CorWin. All rights reserved.
//

import UIKit

class CWHCProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var addBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addBtn.layer.borderWidth = 2.0
        addBtn.layer.borderColor = UIColor(red: 57.0/255.0, green: 127.0/255.0, blue: 13.0/255.0, alpha: 1.0).cgColor
        addBtn.layer.cornerRadius = 5 
        addBtn.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
