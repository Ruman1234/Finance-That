//
//  AddCardDetailsViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class AddCardDetailsViewController: UIViewController {

    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var cardNumberTextField: CustomTextField!
    @IBOutlet weak var expirationTextfield: CustomTextField!
    @IBOutlet weak var CVVTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.setButtonTheme()
    }

    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
}
