//
//  ReviewPageTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 31/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ReviewPageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var monthsLbl: UILabel!
    @IBOutlet weak var readMoreLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var dropDownBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
