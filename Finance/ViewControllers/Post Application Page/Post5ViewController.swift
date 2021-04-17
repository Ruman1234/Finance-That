//
//  Post5ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class Post5ViewController: UIViewController {
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var yearTextField: CustomTextField!
    @IBOutlet weak var makeTextField: CustomTextField!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var modelTextField: CustomTextField!
    @IBOutlet weak var kmLbl: UILabel!
    @IBOutlet weak var kmTextField: CustomTextField!
    @IBOutlet weak var vinLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var vinTextField: CustomTextField!
    @IBOutlet weak var conditionTextField: CustomTextField!
    
    @IBOutlet weak var conditionDropDownBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    let datePicker = UIDatePicker()
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.setButtonTheme()
        
        showDatePicker()
        
        dropDown.anchorView = conditionDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown.width = self.conditionDropDownBtn.frame.width
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["New", "Used"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            //            unhide()
            if index == 0 {
                self.conditionTextField.text = "New"
            }else if index == 1 {
                self.conditionTextField.text = "Used"
            }
        }
    }
    
    func validInput() -> Bool {
        var flag = true
        if yearTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Model Year")
            flag = false
        }else if makeTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Make")
            flag = false
        }else if modelTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Model")
            flag = false
        }else if kmTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter KiloMeter driven")
            flag = false
        }else if vinTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter VIN Number")
            flag = false
        }else if conditionTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please Select Condition")
            flag = false
        }
        return flag
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 900)
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.setData(dict: &PostApplicaitonObject.vehicle)
        if self.validInput() {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post6ViewController") as! Post6ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
        
    }
    //    vehicle
    func setData(dict:inout [String : Any]) {
        dict["year"]         = self.yearTextField.text      ?? ""
        dict["make"]         = self.makeTextField.text      ?? ""
        dict["model"]        = self.modelTextField.text     ?? ""
        dict["kilometer"]    = self.kmTextField.text        ?? ""
        dict["vin"]          = self.vinTextField.text       ?? ""
        dict["condition"]    = self.conditionTextField.text ?? ""
        PostApplicaitonObject.mainObject["vehicle"] = dict
    }
    
    @IBAction func conditionDropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
    
}

extension Post5ViewController {
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
        
        yearTextField.inputAccessoryView = toolbar
        yearTextField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = PostApplicaitonObject.dateFormate
        yearTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}
