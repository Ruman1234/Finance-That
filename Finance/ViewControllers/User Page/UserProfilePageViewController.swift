//
//  UserProfilePageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 28/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserProfilePageViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileLbl: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var stateTextField: CustomTextField!
    @IBOutlet weak var postCodeLbl: UILabel!
    @IBOutlet weak var postCodeTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryTextField: CustomTextField!
    @IBOutlet weak var emailAddressLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var phoneNumTextField: CustomTextField!
    @IBOutlet weak var PasswordBackView: UIView!
    @IBOutlet weak var changeYourPasswordLbl: UILabel!
    @IBOutlet weak var currentPasswordLbl: UILabel!
    @IBOutlet weak var currentPasswordTextField: CustomTextField!
    @IBOutlet weak var newPassLbl: UILabel!
    @IBOutlet weak var newPasswordTextField: CustomTextField!
    @IBOutlet weak var forgotPassBtn: UIButton!
    @IBOutlet weak var strongLbl: UILabel!
    @IBOutlet weak var greenView1: UIView!
    @IBOutlet weak var greenView2: UIView!
    @IBOutlet weak var greenView3: UIView!
    @IBOutlet weak var greenView4: UIView!
    @IBOutlet weak var confirmPassLbl: UILabel!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var updatePassBtn: UIButton!
    @IBOutlet weak var currentPassEyeBtn: UIButton!
    @IBOutlet weak var newPassEyeBtn: UIButton!
    @IBOutlet weak var confirmPassEyeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileLbl.textColor = Color.App_theme_color
        userName.textColor = Color.App_theme_color
        userProfileLbl.textColor = Color.gray_theme_color
        firstName.textColor = Color.App_theme_color
        lastNameLbl.textColor = Color.App_theme_color
        stateLbl.textColor = Color.App_theme_color
        postCodeLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        countryLbl.textColor = Color.App_theme_color
        emailAddressLbl.textColor = Color.App_theme_color
        phoneNumLbl.textColor = Color.App_theme_color
        changeYourPasswordLbl.textColor = Color.App_theme_color
        currentPasswordLbl.textColor = Color.App_theme_color
        newPassLbl.textColor = Color.App_theme_color
        confirmPassLbl.textColor = Color.App_theme_color
        strongLbl.textColor = Color.App_theme_color
        forgotPassBtn.setTitleColor(Color.primary_theme_color, for: .normal)
        
        updatePassBtn.setButtonTheme()
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 1549)
    }
    
    @IBAction func updatePasswordBtn(_ sender: Any) {
    }
    
    
    @IBAction func currentPassEyeBtn(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            currentPasswordTextField.isSecureTextEntry = true
        } else{
            sender.isSelected = true
            currentPasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func newPassEyeBtn(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            newPasswordTextField.isSecureTextEntry = true
        } else{
            sender.isSelected = true
            newPasswordTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func confirmPassEyeBtn(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            confirmPasswordTextField.isSecureTextEntry = true
        } else{
            sender.isSelected = true
            confirmPasswordTextField.isSecureTextEntry = false
        }
    }
}
