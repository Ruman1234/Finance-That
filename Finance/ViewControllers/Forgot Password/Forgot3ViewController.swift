//
//  Forgot3ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 26/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Forgot3ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var newLbl: UILabel!
    @IBOutlet weak var newPassTextField: CustomTextField!
    @IBOutlet weak var reEnterLbl: UILabel!
    @IBOutlet weak var renterPassTextfield: CustomTextField!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var passwordStatusLbl: UILabel!
    
    var code = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotLbl.textColor = Color.App_theme_color
        newLbl.textColor = Color.App_theme_color
        reEnterLbl.textColor = Color.App_theme_color
        changeBtn.setButtonTheme()
        
        self.view(view: view1)
        self.view(view: view2)
        self.view(view: view3)
        self.view(view: view4)
        newPassTextField.enablePasswordToggle()
        renterPassTextfield.enablePasswordToggle()
        newPassTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    @objc func textFieldDidChange(textField: UITextField) {
//        MARK:- Password Status checker
        /*
        there are 4 checks for green defined regex // strong
        if textCount < 8 && textCount > 4          // weak
        textCount < 3                              // weak
        textCount > 7                              // medium */
        
        let defaultColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1).cgColor
        let textCount = newPassTextField.text?.count ?? 0
        if newPassTextField.isValidPassword() || textCount > 13{
            let greenColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
            view1.layer.backgroundColor = greenColor
            view2.layer.backgroundColor = greenColor
            view3.layer.backgroundColor = greenColor
            view4.layer.backgroundColor = greenColor
            passwordStatusLbl.text = "Strong"
        }else if textCount < 8 && textCount > 4{
            let redColor = UIColor.red.cgColor
            view1.layer.backgroundColor = redColor
            view2.layer.backgroundColor = redColor
            view3.layer.backgroundColor = defaultColor
            view4.layer.backgroundColor = defaultColor
            passwordStatusLbl.text = "Weak"
        }else if textCount < 3{
            let redColor = UIColor.red.cgColor
            view1.layer.backgroundColor = redColor
            view2.layer.backgroundColor = defaultColor
            view3.layer.backgroundColor = defaultColor
            view4.layer.backgroundColor = defaultColor
            passwordStatusLbl.text = "Weak"
        }else if textCount > 7 && textCount < 13{
            let orangeColor = UIColor.orange.cgColor
            view1.layer.backgroundColor = orangeColor
            view2.layer.backgroundColor = orangeColor
            view3.layer.backgroundColor = orangeColor
            view4.layer.backgroundColor = defaultColor
            passwordStatusLbl.text = "Medium"
        }
    }
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func validInput()  -> Bool{
        var flag = true
        if self.newPassTextField.text == ""{
            flag = false
        }else if self.renterPassTextfield.text == ""{
            flag = false
        }else if self.newPassTextField.text != renterPassTextfield.text{
            flag = false
        }
        return flag
    }
    func resetComplete() {
        
        NetworkManager.SharedInstance.ResetComplete(password: self.newPassTextField.text!, token:self.code, viewcontroller: self) { (res) in
            if res.status == true{
                
            }
        } failure: { (err) in
            print("Failed")
        }

    }
    
    func view(view : UIView)  {
        view.backgroundColor = .white


        view.layer.backgroundColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1).cgColor
        view.layer.cornerRadius = 4
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor

    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func changePassBtn(_ sender: Any) {
        if self.validInput(){
            resetComplete()
            let main = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            self.navigationController?.pushViewController(main, animated: true)

        }

    }
    
}
