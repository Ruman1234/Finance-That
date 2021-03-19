//
//  Utilities.swift
//  Finance
//
//  Created by Ammar Irfan on 11/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import UIKit
let MaxEmailLength = 250
class Utilities {
    static func isValid(email:NSString) -> Bool {
            
            let emailRegex:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let emailTestPredicate:NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            let validEmail:Bool = emailTestPredicate.evaluate(with: email)
            
            if (validEmail && email.length <= MaxEmailLength) {
                return true
            } else {
                return false
            }
        }
    static func ShowAlert (title:String , message :String, view : UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        }))
        
        view.present(alert, animated: true)
        
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }

        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
}
