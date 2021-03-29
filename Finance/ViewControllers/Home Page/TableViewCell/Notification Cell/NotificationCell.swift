//
//  NotificationCell.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView(view: mainView)
        name.textColor = Color.App_theme_color
        messageLbl.textColor = Color.gray_theme_color
        dayLbl.textColor = UIColor(red: 0.667, green: 0.671, blue: 0.678, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor    }
}
