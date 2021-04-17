//
//  AllDoneViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 06/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AllDoneViewController: UIViewController {

    @IBOutlet weak var myAdsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAdsBtn.setButtonTheme()
    }

    @IBAction func myAds(_ sender: Any) {
    }
}
