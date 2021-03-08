//
//  Dealer6ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer6ViewController: UIViewController {

    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var VoidLbl: UILabel!
    @IBOutlet weak var voidUploadBtn: UIButton!
    @IBOutlet weak var DealershipLbl: UILabel!
    @IBOutlet weak var DealershipUploadBtn: UIButton!
    @IBOutlet weak var dealershipExteriorLbl : UILabel!
    @IBOutlet weak var dealershipExteriorbtn: UIButton!
    @IBOutlet weak var ArticleLbl: UILabel!
    @IBOutlet weak var articleUploadBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        VoidLbl.textColor = Color.App_theme_color
        DealershipLbl.textColor = Color.App_theme_color
        dealershipExteriorLbl.textColor = Color.App_theme_color
        ArticleLbl.textColor = Color.App_theme_color
        
        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10
        
        self.design(btn: previousBtn)
        self.upload(btn: voidUploadBtn)
        self.upload(btn: DealershipUploadBtn)
        self.upload(btn: dealershipExteriorbtn)
        self.upload(btn: articleUploadBtn)
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
    
    func upload(btn :UIButton)  {
          btn.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
          btn.layer.cornerRadius = 5
          btn.layer.borderWidth = 1
          btn.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.933, alpha: 1).cgColor
          btn.setTitleColor(Color.App_theme_color, for: .normal)
      }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer7ViewController") as! Dealer7ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
