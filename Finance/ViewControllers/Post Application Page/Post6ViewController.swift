//
//  Post6ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post6ViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
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
    @IBOutlet weak var telephoneTextField: CustomTextField!
    @IBOutlet weak var nextbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLbl.textColor = Color.App_theme_color
        firstLbl.textColor = Color.App_theme_color
        lastLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        postalLbl.textColor = Color.App_theme_color
        emailLbl.textColor = Color.App_theme_color
        telephoneLbl.textColor = Color.App_theme_color

        nextbtn.setButtonTheme()

    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 1000)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func validInput() -> Bool {
        var flag = true
        if firstNameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter First Name")
            flag = false
        }else if lastNameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Last Name")
            flag = false
        }else if streetTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Street Address")
            flag = false
        }else if cityTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter City")
            flag = false
        }else if provinceTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Province")
            flag = false
        }else if postalTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Postal Code")
            flag = false
        }else if emailTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Email")
            flag = false
        }else if telephoneTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone")
            flag = false
        }
        return flag
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.setData(dict: &PostApplicaitonObject.seller)
        if self.validInput() {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post7ViewController") as! Post7ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
    func setData(dict:inout [String : Any]) {
        dict["first_name"]          = self.firstNameTextField.text      ?? ""
        dict["last_name"]           = self.lastNameTextField.text       ?? ""
        dict["street"]              = self.streetTextField.text         ?? ""
        dict["city"]                = self.cityTextField.text           ?? ""
        dict["province"]            = self.provinceTextField.text       ?? ""
        dict["postal_code"]         = self.postalTextField.text         ?? ""
        dict["email"]               = self.emailTextField.text          ?? ""
        dict["telephone"]           = self.telephoneTextField.text      ?? ""
        PostApplicaitonObject.mainObject["seller"] = dict
    }
    
   
}
