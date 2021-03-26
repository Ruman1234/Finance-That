//
//  NotificationCell.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
