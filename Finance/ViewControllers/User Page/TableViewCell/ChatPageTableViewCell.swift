//
//  ChatPageTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ChatPageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var onlineView: UIView!
    @IBOutlet weak var hondaLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView(view: mainView)
        hondaLbl.textColor = Color.App_theme_color
        messageLbl.textColor = Color.gray_theme_color
        dayLbl.textColor = Color.gray_theme_color
        onlineView.setRoundView()
    }
    
    func setView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
