//
//  RecentSearchTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 26/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class RecentSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var locImg: UIImageView!
    @IBOutlet weak var airLbl: UILabel!
    @IBOutlet weak var numLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
