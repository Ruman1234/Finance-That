//
//  AboutusTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 09/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AboutusTableViewCell: UITableViewCell {

    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var buyAndSellLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

