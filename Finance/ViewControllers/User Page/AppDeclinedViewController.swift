//
//  AppDeclinedViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 11/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AppDeclinedViewController: UIViewController {

    @IBOutlet weak var resubmitNewApplicationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resubmitNewApplicationBtn.setButtonTheme()
    }

    @IBAction func resubmitNewApplication(_ sender: Any) {
        
    }
}
