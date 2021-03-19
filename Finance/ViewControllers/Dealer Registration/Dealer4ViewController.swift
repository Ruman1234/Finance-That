//
//  Dealer4ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class Dealer4ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var numberOfOwnerTextField: CustomTextField!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var dropDownBtn: UIButton!
    
    var legalName = ""
    var operatingName = ""

    var streetAddress = ""
    var city = ""
    var province = ""
    var postalCode = ""
    var emailAddress = ""
    var telephone = ""
    var fax = ""
    
    let dropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        numberLbl.textColor = Color.App_theme_color

        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

        self.design(btn: previous)
        
        dropDown.anchorView = dropDownBtn // UIView or UIBarButtonItem

        dropDown.width = 400
                // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["1", "2","3","4","5"]
                
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    
                    if index == 0 {
                        self.numberOfOwnerTextField.text = "1"
                    }else if index == 1 {
                        self.numberOfOwnerTextField.text = "2"

                    }else if index == 2 {
                        self.numberOfOwnerTextField.text = "3"

                    }else if index == 3 {
                        self.numberOfOwnerTextField.text = "4"

                    }else if index == 4 {
                        self.numberOfOwnerTextField.text = "5"
                    }
    }
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func design(btn :UIButton)  {
        
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.red_theme_color.cgColor
        btn.setTitleColor(Color.red_theme_color, for: .normal)

    }

    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextbtn(_ sender: Any) {
        
        if numberOfOwnerTextField.text?.isEmpty == true {
            createAlert(title: nil, message: "Please enter Number of owners")
        }else {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer5ViewController") as! Dealer5ViewController
            main.numberOfOwners = Int(numberOfOwnerTextField.text!)!
            main.legalName = self.legalName
            main.operatingName = self.operatingName
            main.streetAddress = self.streetAddress
            main.city = self.city
            main.province = self.province
            main.postalCode = self.postalCode
            main.emailAddress = self.emailAddress
            main.telephone = self.telephone
            main.fax = self.fax
            
            
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
    @IBAction func dropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
}
