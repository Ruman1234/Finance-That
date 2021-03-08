//
//  UserPage2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserPage2ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var linkedinBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleBtn.layer.cornerRadius = 10
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
        
        facebookBtn.layer.cornerRadius = 10
        facebookBtn.layer.borderWidth = 1
        facebookBtn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
        
        linkedinBtn.layer.cornerRadius = 10
        linkedinBtn.layer.borderWidth = 1
        linkedinBtn.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
        
        continueBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        continueBtn.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func googleBtn(_ sender: Any) {
    }
    
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
    @IBAction func linkedinBtn(_ sender: Any) {
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage3ViewController") as! UserPage3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
