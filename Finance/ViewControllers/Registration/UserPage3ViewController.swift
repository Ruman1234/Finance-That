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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        createBtn.layer.cornerRadius = 10
        
        radioBtn.layer.borderColor = UIColor(red: 0.506, green: 0.858, blue: 0.057, alpha: 1).cgColor
        radioBtn.layer.borderWidth = 1
        
//        nameTextField.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
//        nameTextField.layer.borderColor = UIColor.red.cgColor
//        nameTextField.layer.borderWidth = 1.14
//        nameTextField.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        // Do any additional setup after loading the view
        scroller.contentSize = CGSize(width: 400, height: 900)
    }
    
    @IBAction func radioBtn(_ sender: Any) {
        
        if radioBtn.isSelected == true{
            radioBtn.isSelected = false
        }else if radioBtn.isSelected == false {
            radioBtn.isSelected = true
        }
    }
    
    @IBAction func createAccBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage4ViewController") as! UserPage4ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func signInBtn(_ sender: Any) {
    }
}
