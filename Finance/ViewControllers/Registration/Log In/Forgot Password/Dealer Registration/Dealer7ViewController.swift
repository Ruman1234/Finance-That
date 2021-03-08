//
//  Dealer7ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer7ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var readLbl: UILabel!
    @IBOutlet weak var ifYouNeedlbl: UILabel!
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        readLbl.textColor = Color.App_theme_color
        ifYouNeedlbl.textColor = Color.App_theme_color
        
        submitBtn.setTitleColor(Color.white_theme_color, for: .normal)
        submitBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        submitBtn.layer.cornerRadius = 10

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
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func radioBtn(_ sender: Any) {
        
        if radioBtn.isSelected == true{
            radioBtn.isSelected = false
        }else if radioBtn.isSelected == false {
            radioBtn.isSelected = true
        }
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func submitBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer8ViewController") as! Dealer8ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
