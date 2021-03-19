//
//  Post6ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post6ViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var streetTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var postalTextField: CustomTextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var telephoneLbl: UILabel!
    @IBOutlet weak var telephoneTextField: CustomTextField!
    @IBOutlet weak var nextbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLbl.textColor = Color.App_theme_color
        firstLbl.textColor = Color.App_theme_color
        lastLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        postalLbl.textColor = Color.App_theme_color
        emailLbl.textColor = Color.App_theme_color
        telephoneLbl.textColor = Color.App_theme_color

        nextbtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextbtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextbtn.layer.cornerRadius = 10

    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: 400, height: 1000)
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
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post7ViewController") as! Post7ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
}
