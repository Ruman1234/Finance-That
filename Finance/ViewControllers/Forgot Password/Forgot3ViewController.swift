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
    
    var code = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotLbl.textColor = Color.App_theme_color
        newLbl.textColor = Color.App_theme_color
        reEnterLbl.textColor = Color.App_theme_color
        changeBtn.setTitleColor(Color.white_theme_color, for: .normal)
        changeBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        changeBtn.layer.cornerRadius = 10
        
        self.view(view: view1)
        self.view(view: view2)
        self.view(view: view3)
        self.view(view: view4)

        
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
       
        view.layer.backgroundColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.82, green: 0.827, blue: 0.839, alpha: 1).cgColor

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
