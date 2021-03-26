//
//  ApplicationDetailTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 24/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ApplicationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fileNameLbl: UILabel!
    @IBOutlet weak var idNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fileNameLbl.textColor = Color.App_theme_color
        idNameLbl.textColor = Color.App_theme_color
        dateLbl.textColor = Color.App_theme_color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
