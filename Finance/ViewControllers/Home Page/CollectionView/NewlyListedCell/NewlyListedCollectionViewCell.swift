//
//  NewlyListedCollectionViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 19/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class NewlyListedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tagImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var skiLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var locImg: UIImageView!
    @IBOutlet weak var bramptonLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
