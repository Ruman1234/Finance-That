//
//  MyApplicationPageTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class MyApplicationPageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var approvedLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var calenderLbl: UILabel!
    @IBOutlet weak var calenderImg: UIImageView!
    @IBOutlet weak var blueColorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        viewBtn.layer.cornerRadius = 10
        
        blueColorView.setRoundView()
        setView(view: mainView)
   }
    
    func setView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
