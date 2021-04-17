//
//  MyAdsTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class MyAdsTableViewCell: UITableViewCell {

    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var skiDooLbl: UILabel!
    @IBOutlet weak var grangerLbl: UILabel!
    @IBOutlet weak var expiresLbl: UILabel!
    @IBOutlet weak var viewsLbl: UILabel!
    @IBOutlet weak var messagesLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        skiDooLbl.textColor = Color.App_theme_color
        grangerLbl.textColor = Color.gray_theme_color
        expiresLbl.textColor = Color.App_theme_color
        viewsLbl.textColor = Color.App_theme_color
        messagesLbl.textColor = Color.App_theme_color
        priceLbl.textColor = Color.App_theme_color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
