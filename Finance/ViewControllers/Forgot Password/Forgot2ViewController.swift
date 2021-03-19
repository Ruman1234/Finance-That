//
//  Forgot2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 26/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit


class Forgot2ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var pleaseLbl: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var didntLbl: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var txt6: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        forgotLbl.textColor = Color.App_theme_color
        pleaseLbl.textColor = Color.App_theme_color
        lbl3.textColor = Color.App_theme_color
        codeLbl.textColor = Color.App_theme_color
        didntLbl.textColor = Color.gray_theme_color
        resendBtn.setTitleColor(Color.red_theme_color, for: .normal)
        
        
        self.setTextField(textField: self.txt1)
        self.setTextField(textField: self.txt2)
        self.setTextField(textField: self.txt3)
        self.setTextField(textField: self.txt4)
        self.setTextField(textField: self.txt5)
        self.setTextField(textField: self.txt6)
        
        continueBtn.setTitleColor(Color.white_theme_color, for: .normal)
        continueBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        continueBtn.layer.cornerRadius = 10

    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setTextField(textField : UITextField)  {
        textField.OTPDesign()
        textField.delegate = self
    }
        
    func validInput() -> Bool {
        var flag = true
        if txt1.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }else if txt2.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }else if txt3.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }else if txt4.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }else if txt5.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }else if txt6.text!.isEmpty {
            createAlert(title: nil, message: "Please enter code")
            flag = false
        }
        
        return flag
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resendBtn(_ sender: Any) {
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        
        if self.validInput(){
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Forgot3ViewController") as! Forgot3ViewController
            main.code = self.mergeStr()
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
    
    
}

extension Forgot2ViewController{
    func mergeStr() -> String {
        var password = self.txt1.text! + self.txt2.text!
        password = password + self.txt3.text! + self.txt4.text!
        password = password + self.txt5.text! + self.txt6.text!
        
        return password
        
    }
}

extension Forgot2ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            print("Backspace was pressed")
        }
        if textField == txt1 {
            if (textField.text?.count)! >= 1 {
                if (txt2.text?.count)! >= 1 && (textField.text?.count)! == 0 {
                    txt1.text = string
                }else{
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                    }else{
                        txt2.text = string
                        txt2.becomeFirstResponder()
                    }
                }
                
                
            }
        }else if textField == txt2 {
            if (textField.text?.count)! >= 1 {
                if (txt3.text?.count)! >= 1 && (textField.text?.count)! == 0 {
                    txt2.text = string
                }else{
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                    }else{
                        txt3.text = string
                        txt3.becomeFirstResponder()
                    }
                    
                }
                
                
            }
        }else if textField == txt3 {
            if (textField.text?.count)! >= 1 {
                if (txt4.text?.count)! >= 1 && (textField.text?.count)! == 0 {
                    txt3.text = string
                }else{
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                    }else{
                        txt4.text = string
                        txt4.becomeFirstResponder()
                    }
                }
                
                
            }
        }else if textField == txt4{
            if (textField.text?.count)! >= 1 {
                if (txt5.text?.count)! >= 1 && (textField.text?.count)! == 0 {
                    txt4.text = string
                }else{
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                    }else{
                        txt5.text = string
                        txt5.becomeFirstResponder()
                    }
                }
                
                
            }
        }else if textField == txt5{
            if (textField.text?.count)! >= 1 {
                if (txt6.text?.count)! >= 1 && (textField.text?.count)! == 0 {
                    txt5.text = string
                }else{
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                    }else{
                        txt6.text = string
                        txt6.becomeFirstResponder()
                    }
                }
                
                
            }
        }else {
            if (textField.text?.count)! >= 1 {
                textField.text = string
                txt6.resignFirstResponder()
            }
        }
        return true
    }
    
    
}

extension UITextField {
    func OTPDesign() {
        let radius = CGFloat(8.0)
        self.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1).cgColor
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 2
    }
}
