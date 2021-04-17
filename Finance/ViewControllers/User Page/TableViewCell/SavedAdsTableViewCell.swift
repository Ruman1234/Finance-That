//
//  SavedAdsTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SavedAdsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var skiLbl: UILabel!
    @IBOutlet weak var bramtonLbl: UILabel!
    @IBOutlet weak var numLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
        
        priceLbl.textColor = Color.App_theme_color
        skiLbl.textColor = Color.App_theme_color
        bramtonLbl.textColor = Color.gray_theme_color
        numLbl.textColor = Color.primary_theme_color

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
