//
//  UserPage3ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserPage3ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmLbl: UILabel!
    @IBOutlet weak var confirmTextField: CustomTextField!
    @IBOutlet weak var agreeLbl: UILabel!
    @IBOutlet weak var alreadyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        firstLbl.textColor = Color.App_theme_color
        lastNameLbl.textColor = Color.App_theme_color
        emailLbl.textColor = Color.App_theme_color
        passwordLbl.textColor = Color.App_theme_color
        confirmLbl.textColor = Color.App_theme_color
        agreeLbl.textColor = Color.App_theme_color
        alreadyLbl.textColor = Color.App_theme_color

        createBtn.setTitleColor(Color.white_theme_color, for: .normal)
        createBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        createBtn.layer.cornerRadius = 10

        radioBtn.layer.borderColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
        radioBtn.layer.borderWidth = 1
        passwordTextField.enablePasswordToggle()
        confirmTextField.enablePasswordToggle()

    }
    
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        // Do any additional setup after loading the view
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 900)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func radioBtn(_ sender: Any) {
        
        if radioBtn.isSelected == true{
            radioBtn.isSelected = false
        }else if radioBtn.isSelected == false {
            radioBtn.isSelected = true
        }
    }
    
    @IBAction func createAccBtn(_ sender: Any) {
       
        if self.validInput() {
            buyerDetail()
        }
    }
    
    func buyerDetail()  {
        NetworkManager.SharedInstance.BuyerDetail(full_name: nameTextField.text! + lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, user_type: "1",viewcontroller: self) { (res) in
            if res.success == true{
                print(res)
                let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage4ViewController") as! UserPage4ViewController
                self.navigationController?.pushViewController(main, animated: true)
            }
        } failure: { (err) in
            print("failed")
        }
    }
    
    func validInput() -> Bool {
        var flag = true
        if nameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Name")
            flag = false
        }else if emailTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter email")
            flag = false
        }else if passwordTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter password")
            flag = false
        }else if confirmTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please confirm your password")
            flag = false
        }else if lastNameTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter last name")
            flag = false
        }else if radioBtn.isSelected == false {
            createAlert(title: nil, message: "Please Agree with terms and conditions")
            flag = false
        }else if passwordTextField.text != confirmTextField.text{
            flag = false
            createAlert(title: nil, message: "Password not matched")
        }
        return flag
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}

extension UIViewController{
    
    func createAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
