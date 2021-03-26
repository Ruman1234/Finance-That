//
//  Constants.swift
//  Finance
//
//  Created by Ammar Irfan on 08/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import UIKit

class Color {
    
    static let App_theme_color = UIColor(red: 0.247, green: 0.137, blue: 0.333, alpha: 1)
    
    static let red_theme_color = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1)

    static let primary_theme_color = UIColor(red: 0.184, green: 0.502, blue: 0.929, alpha: 1)
    
    static let gray_theme_color = UIColor(red: 0.51, green: 0.514, blue: 0.522, alpha: 1)

    static let white_theme_color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    static let lightgray_theme_color = UIColor(red: 0.965, green: 0.973, blue: 0.984, alpha: 1)

    static let blue_View_color = UIColor(red: 0.341, green: 0.6, blue: 0.945, alpha: 1).cgColor
    
    static let orange_View_color = UIColor(red: 0.949, green: 0.6, blue: 0.29, alpha: 1).cgColor

    static let green_View_color = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor

    static let red_View_color = UIColor(red: 0.979, green: 0.22, blue: 0.311, alpha: 1).cgColor

    static let textfield_grey_color = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)

    static let light_grey_color = UIColor(red: 0.357, green: 0.357, blue: 0.361, alpha: 1)

}

class Constants {
    
    static var BASE_URL = "http://24.227.130.19:8000/"
    static let DEALER_DETAIL = "dealer_details/create/"
    static let BUYER_DETAIL = "buyer_details/create/"
    static let LOGIN = "api/token/"
    static let EMAIL = "request-reset-email/"
    static let RESET_PASSWORD = "password-reset-complete/"

}

extension UIButton{
    func setButtonTheme()  {
        self.layer.backgroundColor = Color.red_theme_color.cgColor
        self.layer.cornerRadius = 20
        self.setTitleColor(Color.white_theme_color, for: .normal)
    }
}

extension UIView{
    func setRoundView() {
        self.layer.cornerRadius = self.frame.size.width/2
    }
}

extension UIFont{
    func BasisGrotesqueProMedium(size : CGFloat) -> UIFont {
        return UIFont(name: "Basis Grotesque Pro Medium", size: size)!
    }
}
