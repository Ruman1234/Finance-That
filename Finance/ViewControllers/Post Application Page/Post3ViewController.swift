//
//  Post3ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class Post3ViewController: UIViewController {
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var empStatusLbl: UILabel!
    @IBOutlet weak var typeOfEmpLbl: UILabel!
    @IBOutlet weak var empNameLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var grossIncomLbl: UILabel!
    @IBOutlet weak var empSinceLbl: UILabel!
    @IBOutlet weak var coAppLbl: UILabel!
    @IBOutlet weak var coAppYesLbl: UILabel!
    @IBOutlet weak var coAppnoLBl: UILabel!
    
    @IBOutlet weak var statusTextField: CustomTextField!
    @IBOutlet weak var secondTextField: CustomTextField!
    @IBOutlet weak var thirdTextField: CustomTextField!
    @IBOutlet weak var fourthTextField: CustomTextField!
    @IBOutlet weak var empSinceTextField: CustomTextField!
    @IBOutlet weak var grossIncomeTextField: CustomTextField!

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var empStatusDropDownBtn: UIButton!
    @IBOutlet weak var typeOfEmpStatusDropDownBtn: UIButton!
    
    @IBOutlet weak var noRadioBtn: UIButton!
    @IBOutlet weak var typeOfEmploymentView: UIView!
    @IBOutlet weak var yesRadioBtn: UIButton!
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PostApplicaitonObject.IsCoApplicant{
            coAppLbl.isHidden = true
            coAppYesLbl.isHidden = true
            coAppnoLBl.isHidden = true
            noRadioBtn.isHidden = true
            yesRadioBtn.isHidden = true
        }
        
        nextBtn.setButtonTheme()
        noRadioBtn.isSelected = true
        
        dropDown.anchorView = empStatusDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown.width = self.empStatusDropDownBtn.frame.width
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Employed", "Self Employed", "Retired", "Unemployed"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            unHide()
            if index == 0 {
                self.statusTextField.text = "Employed"
                
            }else if index == 1 {
                self.statusTextField.text = "Self Employed"
                occupationLbl.isHidden = true
                fourthTextField.isHidden = true
                typeOfEmpStatusDropDownBtn.isHidden = true
                typeOfEmpLbl.text = "Business name"
                secondTextField.placeholder = "Enter Business here"
                empNameLbl.text = "Type of Business"
                thirdTextField.placeholder = "Business Type"
                empSinceLbl.text = "Duration of Business"
                empSinceTextField.placeholder = "YYYY-MM-DD"
                
            }else if index == 2 {
                self.statusTextField.text = "Retired"
                empNameLbl.isHidden = true
                occupationLbl.isHidden = true
                typeOfEmpLbl.isHidden = true
                grossIncomLbl.isHidden = false
                typeOfEmpStatusDropDownBtn.isHidden = true
                secondTextField.isHidden = true
                thirdTextField.isHidden = true
                fourthTextField.isHidden = true
                empSinceTextField.isHidden = true
                typeOfEmploymentView.isHidden = true
                grossIncomeTextField.isHidden = false
                empNameLbl.isHidden = true
                empSinceLbl.isHidden = true
            }else if index == 3 {
                self.statusTextField.text = "Unemployed"
                empNameLbl.isHidden = true
                occupationLbl.isHidden = true
                typeOfEmpLbl.isHidden = true
                grossIncomLbl.isHidden = true
                typeOfEmpStatusDropDownBtn.isHidden = true
                secondTextField.isHidden = true
                thirdTextField.isHidden = true
                fourthTextField.isHidden = true
                grossIncomeTextField.isHidden = true
                empSinceTextField.isHidden = true
                empSinceLbl.isHidden = true
                
                typeOfEmploymentView.isHidden = true
                
            }
        }
        
        
        dropDown2.anchorView = empStatusDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown2.width = self.empStatusDropDownBtn.frame.width
        // The list of items to display. Can be changed dynamically
        dropDown2.dataSource = ["Full Time", "Part Time", "Seasonal"]
        
        // Action triggered on selection
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            if index == 0 {
                self.secondTextField.text = "Full Time"
            }else if index == 1 {
                self.secondTextField.text = "Part Time"
            }else if index == 2 {
                self.secondTextField.text = "Seasonal"
            }
        }
        
        showDatePicker()
    }
    func unHide()  {
        empNameLbl.isHidden = false
        occupationLbl.isHidden = false
        typeOfEmpLbl.isHidden = false
        grossIncomLbl.isHidden = false
        typeOfEmpStatusDropDownBtn.isHidden = false
        secondTextField.isHidden = false
        thirdTextField.isHidden = false
        fourthTextField.isHidden = false
        grossIncomeTextField.isHidden = false
        empSinceTextField.isHidden = false
        grossIncomLbl.isHidden = false
        empSinceLbl.isHidden = false
        typeOfEmploymentView.isHidden = false
    }
    
    func validInput() -> Bool {
        var flag = true
        if statusTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter First Name")
            flag = false
        }else if secondTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Last Name")
            flag = false
        }
        if thirdTextField.isHidden == false {
            if thirdTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please \(self.thirdTextField.placeholder ?? "")")
                flag = false
            }
        }
        if fourthTextField.isHidden == false {
            if fourthTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please \(self.fourthTextField.placeholder ?? "")")
                flag = false
            }
        }
        if empSinceTextField.isHidden == false {
            if empSinceTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please \(self.empSinceTextField.placeholder ?? "")")
                flag = false
            }
        }
        if grossIncomeTextField.isHidden == false {
            if grossIncomeTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please \(self.grossIncomeTextField.placeholder ?? "")")
                flag = false
            }
        }
        if !yesRadioBtn.isSelected && !noRadioBtn.isSelected{
            createAlert(title: nil, message: "Please Select Option for Co-Applicant")
            flag = false
        }
        return flag
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 831)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesRadioBtn(_ sender: UIButton) {
        noRadioBtn.isSelected = false
        if sender.isSelected == true {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
    
    @IBAction func noRadioBtn(_ sender: UIButton) {
        yesRadioBtn.isSelected = false
        if sender.isSelected == true {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if !validInput(){return}
        if PostApplicaitonObject.IsCoApplicant{
            self.setData(dict: &PostApplicaitonObject.coAppObject)
        }else{
            self.setData(dict: &PostApplicaitonObject.mainObject)
        }
        
        
        print(PostApplicaitonObject.mainObject)
        if yesRadioBtn.isSelected{
            PostApplicaitonObject.IsCoApplicant = true
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post1ViewController") as! Post1ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }else{
            if PostApplicaitonObject.IsCoApplicant{
                PostApplicaitonObject.mainObject["co_applicant"] = PostApplicaitonObject.coAppObject
            }
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post4ViewController") as! Post4ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
        
    }
    
    func setData(dict:inout [String : Any]) {
        dict["employement_status"]           = self.statusTextField.text        ?? ""
        dict["type_of_employment"]           = self.secondTextField.text        ?? ""
        dict["employer_name"]                = self.thirdTextField.text         ?? ""
        dict["occupation"]                   = self.fourthTextField.text        ?? ""
        dict["employment_since"]             = self.empSinceTextField.text      ?? ""
        dict["gross_income"]                 = self.grossIncomeTextField.text   ?? ""
        if self.secondTextField.text == "Self Employed"{
            dict["type_of_business"]         = self.thirdTextField.text         ?? ""
            dict["business_name"]            = self.secondTextField.text        ?? ""
            dict["type_of_employment"]       = "Full Time"
//    type_of_employment always full time is case of business as discussed
        }else{
            dict["type_of_employment"]       = self.secondTextField.text        ?? ""
            dict["employer_name"]            = self.thirdTextField.text         ?? ""
        }
    }
    @IBAction func empStatusDropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
    
    
    @IBAction func typOfEmpStatusDropDownBtn(_ sender: Any) {
        self.dropDown2.show()
    }
}

extension Post3ViewController {
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        empSinceTextField.inputAccessoryView = toolbar
        empSinceTextField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = PostApplicaitonObject.dateFormate
        empSinceTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}
