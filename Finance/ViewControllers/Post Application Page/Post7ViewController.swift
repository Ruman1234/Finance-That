//
//  Post7ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post7ViewController: UIViewController {

    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var financingLbl: UILabel!
    @IBOutlet weak var financingTextField: CustomTextField!
    @IBOutlet weak var signUpLbl: UILabel!
    @IBOutlet weak var haveReadLbl: UILabel!
    @IBOutlet weak var agreeLbl: UILabel!
    @IBOutlet weak var radioBtn1: UIButton!
    @IBOutlet weak var radioBtn2: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    var isHideAmountFields = false
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if isHideAmountFields{
            financingLbl.isHidden = true
            financingTextField.isHidden = true
        }
        nextBtn.setButtonTheme()

    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func validInput() -> Bool {
        var flag = true
        if !financingTextField.isHidden{
            if financingTextField.text!.isEmpty {
                createAlert(title: nil, message: "Please enter Finance Amount")
                flag = false
            }
        }else if !radioBtn1.isSelected {
            createAlert(title: nil, message: "Please Select Terms & conditions")
            flag = false
        }else if !radioBtn2.isSelected{
            createAlert(title: nil, message: "Please Read credit Report and confirm it")
            flag = false
        }
        return flag
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func radioBtn1(_ sender: Any) {
        
        if radioBtn1.isSelected == true{
            radioBtn1.isSelected = false
        }else if radioBtn1.isSelected == false {
            radioBtn1.isSelected = true
        }
    }
    
    @IBAction func radioBtn2(_ sender: Any) {
        
        if radioBtn2.isSelected == true{
            radioBtn2.isSelected = false
        }else if radioBtn2.isSelected == false {
            radioBtn2.isSelected = true
        }
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if  self.validInput(){
            PostApplicaitonObject.mainObject["financing_amount"] = financingTextField.text ?? ""
            let main = self.storyboard?.instantiateViewController(withIdentifier: "FinalizeApplicationViewController") as! FinalizeApplicationViewController
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
    
}
