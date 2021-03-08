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
        
        self.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        self.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.933, alpha: 1).cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1.14
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
