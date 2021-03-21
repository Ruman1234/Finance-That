//
//  Dealer2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer2ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var legalNameTextField: CustomTextField!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var operatingNameTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl2.textColor = Color.App_theme_color
        lbl3.textColor = Color.App_theme_color
        lbl4.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()
        
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func validInput() -> Bool {
        var flag = true
        if legalNameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Dealership Legal Name")
            flag = false
        }else if operatingNameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Dealership Operating Name")
            flag = false
        }
        
        return flag
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if self.validInput() {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer3ViewController") as! Dealer3ViewController
            main.legalName = legalNameTextField.text!
            main.operatingName = operatingNameTextField.text!
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
    
}
