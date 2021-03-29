//
//  CarNamesCollectionViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 24/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class CarNamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carNameBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carButton(btn: carNameBtn)
    }
    
    func carButton(btn : UIButton) {
        btn.layer.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1).cgColor
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
    }
}
