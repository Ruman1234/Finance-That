//
//  CategoriesTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 26/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var roundColorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundColorView.setRoundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func radioBtn(_ sender: Any) {
        if radioBtn.isSelected == true{
            radioBtn.isSelected = false
        }else if radioBtn.isSelected == false {
            radioBtn.isSelected = true
        }
    }
}
