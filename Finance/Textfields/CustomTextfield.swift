//
//  CustomTextfield.swift
//  Finance
//
//  Created by Ammar Irfan on 26/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//
import UIKit

class CustomTextField: UITextField {

    // Whatever you like
    let padding = UIEdgeInsets(top: 9, left: 20, bottom: 9, right: 0);
    // Paddging for place holder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 9, left: 20, bottom: 9, right: 0))
    }
    // Padding for text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    // Padding for text in editting mode
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func setup() {
        self.delegate = self
        self.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        self.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.933, alpha: 1).cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}

extension CustomTextField:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Color.App_theme_color.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = Color.textfield_grey_color.cgColor
    }
}
extension CustomTextField{
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "eyeClose"), for: .normal)
        }else{
            button.setImage(UIImage(named: "eye open"), for: .normal)
            
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}

