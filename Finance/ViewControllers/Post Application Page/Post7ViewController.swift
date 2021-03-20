//
//  Post7ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post7ViewController: UIViewController {

    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var financingLbl: UILabel!
    @IBOutlet weak var financingTextField: CustomTextField!
    @IBOutlet weak var signUpLbl: UILabel!
    @IBOutlet weak var haveReadLbl: UILabel!
    @IBOutlet weak var agreeLbl: UILabel!
    @IBOutlet weak var radioBtn1: UIButton!
    @IBOutlet weak var radioBtn2: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLbl.textColor = Color.App_theme_color
        financingLbl.textColor = Color.App_theme_color
        financingTextField.textColor = Color.App_theme_color
        signUpLbl.textColor = Color.App_theme_color
        haveReadLbl.textColor = Color.App_theme_color
        agreeLbl.textColor = Color.App_theme_color
        
        submitBtn.setButtonTheme()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func radioBtn1(_ sender: Any) {
        
        if radioBtn1.isSelected == true{
            radioBtn1.isSelected = false
        }else if radioBtn1.isSelected == false {
            radioBtn1.isSelected = true
        }
    }
    
    @IBAction func radioBtn2(_ sender: Any) {
        
        if radioBtn2.isSelected == true{
            radioBtn2.isSelected = false
        }else if radioBtn2.isSelected == false {
            radioBtn2.isSelected = true
        }
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post8ViewController") as! Post8ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
