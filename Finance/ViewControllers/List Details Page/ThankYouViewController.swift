//
//  ThankYouViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var backToHomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backToHomeBtn.setButtonTheme()
    }

    @IBAction func backToHomeBtn(_ sender: Any) {
    }
}
