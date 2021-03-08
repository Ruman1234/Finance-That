//
//  Dealer5ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer5ViewController: UIViewController {

    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var firstNameTextField: CustomTextField!
    @IBOutlet weak var lastLbl: UILabel!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var streetAddressTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var CityTextField: CustomTextField!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var postalLbl: UILabel!
    @IBOutlet weak var postalTextField: CustomTextField!
    @IBOutlet weak var telephoneLbl: UILabel!
    @IBOutlet weak var telephoneTextField: CustomTextField!
    @IBOutlet weak var percentageLbl: UILabel!
    @IBOutlet weak var percentageTextField: CustomTextField!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        firstLbl.textColor = Color.App_theme_color
        lastLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        postalLbl.textColor = Color.App_theme_color
        telephoneLbl.textColor = Color.App_theme_color
        percentageLbl.textColor = Color.App_theme_color
        
        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

        self.design(btn: previousBtn)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    func design(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.red_theme_color.cgColor
        btn.setTitleColor(Color.red_theme_color, for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: 400, height: 1000)
    }

    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer6ViewController") as! Dealer6ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
