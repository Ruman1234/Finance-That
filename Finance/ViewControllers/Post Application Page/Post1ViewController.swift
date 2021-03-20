//
//  Post1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 06/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post1ViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var firstNamelbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var lastnameTextField: CustomTextField!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var opplicantLbl: UILabel!
    @IBOutlet weak var yesRadioBtn: UIButton!
    @IBOutlet weak var noRadioBtn: UIButton!
    @IBOutlet weak var yesLbl: UILabel!
    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        firstNamelbl.textColor = Color.App_theme_color
        lastNameLbl.textColor = Color.App_theme_color
        dateLbl.textColor = Color.App_theme_color
        opplicantLbl.textColor = Color.App_theme_color
        yesLbl.textColor = Color.App_theme_color
        noLbl.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesRadioBtn(_ sender: Any) {
        
    }
    
    @IBAction func noRadioBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post2ViewController") as! Post2ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
