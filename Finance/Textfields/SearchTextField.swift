//
//  SearchTextField.swift
//  Finance
//
//  Created by Ammar Irfan on 09/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SearchTextField: UITextField, UITextFieldDelegate {

    // Whatever you like
    let padding = UIEdgeInsets(top: 13, left: 40, bottom: 13, right: 0);
    // Paddging for place holder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 9, left: 40, bottom: 9, right: 0))
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
        self.font = UIFont(name: "BasisGrotesquePro-Regular", size: 15)
        self.textColor = UIColor(red: 0.639, green: 0.639, blue: 0.639, alpha: 1)
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
