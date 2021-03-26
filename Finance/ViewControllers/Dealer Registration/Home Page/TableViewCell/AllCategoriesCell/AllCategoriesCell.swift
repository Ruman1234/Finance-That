//
//  AllCategoriesCell.swift
//  Finance
//
//  Created by Ammar Irfan on 25/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AllCategoriesCell: UITableViewCell {

    @IBOutlet weak var allCategoriesLbl: UILabel!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if (selected) {
            allCategoriesLbl.textColor = Color.red_theme_color
            orangeView.backgroundColor = Color.red_theme_color
            mainView.backgroundColor = .white
        } else {
            allCategoriesLbl.textColor = Color.App_theme_color
            orangeView.backgroundColor = UIColor.white
            mainView.layer.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1).cgColor
            mainView.layer.borderWidth = 0.3
            mainView.layer.borderColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1).cgColor
        }
    }

}
