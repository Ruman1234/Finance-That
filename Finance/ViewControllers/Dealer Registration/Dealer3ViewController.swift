//
//  Dealer3ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer3ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var streetTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var postalTextField: CustomTextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var telephoneLbl: UILabel!
    @IBOutlet weak var telephonetextField: CustomTextField!
    @IBOutlet weak var faxLbl: UILabel!
    @IBOutlet weak var faxTextField: CustomTextField!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    
    var legalName = ""
    var operatingName = ""
    var certificateFile = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        postalLbl.textColor = Color.App_theme_color
        emailLbl.textColor = Color.App_theme_color
        telephoneLbl.textColor = Color.App_theme_color
        faxLbl.textColor = Color.App_theme_color

        nextBtn.setButtonTheme()

        self.design(btn: previousBtn)
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 852)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    func validInput() -> Bool {
        var flag = true
        if streetTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Street Address")
            flag = false
        }else if cityTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter City")
            flag = false
        }else if provinceTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Province")
            flag = false
        }else if postalTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Postal")
            flag = false
        }else if emailTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Email")
            flag = false
        }else if telephonetextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone")
            flag = false
        }else if Utilities.isValid(email: emailTextField.text! as NSString) == false{
            createAlert(title: nil, message: "Please enter correct email")
            flag = false
        }
        return flag
}
    
    func design(btn :UIButton)  {
        
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.setButtonTheme()

    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if self.validInput() {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer4ViewController") as! Dealer4ViewController
            main.streetAddress = streetTextField.text!
            main.city = cityTextField.text!
            main.province = provinceTextField.text!
            main.postalCode = postalTextField.text!
            main.emailAddress = emailTextField.text!
            main.telephone = telephonetextField.text!
            main.fax = faxTextField.text!
            main.legalName = self.legalName
            main.operatingName = self.operatingName
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
}
