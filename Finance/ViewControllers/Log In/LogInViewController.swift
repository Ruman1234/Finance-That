//
//  LogInViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var scolview: UIScrollView!
    @IBOutlet weak var lognLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var forgtBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var dntLbl: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var signLbl: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lognLbl.textColor = Color.App_theme_color
        emailLbl.textColor = Color.App_theme_color
        passwordLbl.textColor = Color.App_theme_color
        forgtBtn.setTitleColor(Color.primary_theme_color, for: .normal)
        loginBtn.setButtonTheme()
        dntLbl.textColor = Color.App_theme_color
        signUpBtn.setTitleColor(Color.App_theme_color, for: .normal)
        signLbl.textColor = Color.gray_theme_color
        
        self.view(view: view1)
        self.view(view: view2)
        
        self.design(btn: googleBtn)
        self.design(btn: fbBtn)
        self.design(btn: linkBtn)
        passwordTextField.enablePasswordToggle()
    }
    override func viewDidLayoutSubviews() {
        scolview.isScrollEnabled = true
        scolview.contentSize = CGSize(width: self.view.frame.width, height: 736)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    
    func design(btn :UIButton)  {
        
        btn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor

    }
    
    func view(view : UIView)  {
       
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor
    }
    
    func validInput() -> Bool {
        var flag = true
        if emailTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter email")
            flag = false
        }else if passwordTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter password")
            flag = false
        }else if Utilities.isValid(email: emailTextField.text! as NSString) == false{
            createAlert(title: nil, message: "Please enter correct email")
            flag = false
        }
        return flag
    }
    
    func login() {
        NetworkManager.SharedInstance.Login(email: emailTextField.text!, password: passwordTextField.text!,viewcontroller: self) { (res) in
            if res.success == true {
                print(res.message ?? "")
//                let homePageStoryBoard = UIStoryboard(name: "HomePage", bundle: nil)
//                let main =
//                    homePageStoryBoard.instantiateViewController(withIdentifier: "HomePage1ViewController") as! HomePage1ViewController
//
//
//                self.navigationController?.pushViewController(main, animated: true)
//                let main = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
//                self.navigationController?.pushViewController(main, animated: true)
                
                let homePageStoryBoard = UIStoryboard(name: "HomePage", bundle: nil)
                let main =
                    homePageStoryBoard.instantiateViewController(withIdentifier: "HomePage1ViewController") as! HomePage1ViewController


                self.navigationController?.pushViewController(main, animated: true)

            }
        } failure: { (err) in
            print("Failed")
        }
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if self.validInput() {
            login()
        }
    }
    
    @IBAction func googleBtn(_ sender: Any) {
    }
    @IBAction func fbBtn(_ sender: Any) {
    }
    @IBAction func linkBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage3ViewController") as! UserPage3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func forgotBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Forgt1ViewController") as! Forgt1ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
