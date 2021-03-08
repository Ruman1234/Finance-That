//
//  Dealer4ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer4ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var numberOfOwnerTextField: CustomTextField!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        numberLbl.textColor = Color.App_theme_color

        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

        self.design(btn: previous)

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
    
    @IBAction func previousBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextbtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer5ViewController") as! Dealer5ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
