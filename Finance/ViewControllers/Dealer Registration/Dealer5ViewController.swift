//
//  Dealer5ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer5ViewController: UIViewController {

    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var streetAddressTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var CityTextField: CustomTextField!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var postalTextField: CustomTextField!
    @IBOutlet weak var telephoneLbl: UILabel!
    @IBOutlet weak var telephoneTextField: CustomTextField!
    @IBOutlet weak var percentageLbl: UILabel!
    @IBOutlet weak var percentageTextField: CustomTextField!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var numberOfOwners = Int()
    var currentOwner = 1
    
    var legalName = ""
    var operatingName = ""
    
    var streetAddress = ""
    var city = ""
    var province = ""
    var postalCode = ""
    var emailAddress = ""
    var telephone = ""
    var fax = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        firstLbl.textColor = Color.App_theme_color
        lastLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        postalLbl.textColor = Color.App_theme_color
        telephoneLbl.textColor = Color.App_theme_color
        percentageLbl.textColor = Color.App_theme_color
         
        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

        self.design(btn: previousBtn)
        lbl1.text = "\(currentOwner.getNumber()) Owner’s Information"
    }
    
    func design(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.red_theme_color.cgColor
        btn.setTitleColor(Color.red_theme_color, for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 900)
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
        }else if streetAddressTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Street Address")
            flag = false
        }else if CityTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter City")
            flag = false
        }else if provinceTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Province")
            flag = false
        }else if postalTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Postal Code")
            flag = false
        }else if telephoneTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Telephone")
            flag = false
        }else if percentageTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Percentage of Ownership")
            flag = false
        }
        return flag
}
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if numberOfOwners == 1 {
            navigateToDealer6()
        }else{
            if self.validInput() {
                let sameVc = self.storyboard?.instantiateViewController(withIdentifier: "Dealer5ViewController") as! Dealer5ViewController
                sameVc.numberOfOwners = self.numberOfOwners - 1
                sameVc.currentOwner = self.currentOwner + 1
                sameVc.legalName = self.legalName
                sameVc.operatingName = self.operatingName
                self.navigationController?.pushViewController(sameVc, animated: true)
            }
        }
    }
    
    func navigateToDealer6()  {
        if self.validInput() {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer6ViewController") as! Dealer6ViewController
//            main.firstName = firstNameTextField.text!
//            main.lastName = lastNameTextField.text!
            main.streetAddress = streetAddressTextField.text!
            main.city = CityTextField.text!
            main.province = provinceTextField.text!
            main.postalCode = postalTextField.text!
            main.telephone = telephoneTextField.text!
//            main.percentage = percentageTextField.text!
            main.legalName = self.legalName
            main.operatingName = self.operatingName
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
}
extension Int{
    func getNumber() -> String {
        if self == 1{
            return "1st"
        }else  if self == 2{
            return "2nd"
        }else  if self == 3{
            return "3rd"
        }else  if self == 4{
            return "4th"
        }else  if self == 5{
            return "5th"
        }
        return ""
    }
}
