//
//  Post4ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post4ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var vehicleLbl: UILabel!
    @IBOutlet weak var vehicleTextField: CustomTextField!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var yesLbl: UILabel!
    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var noRadioBtn: UIButton!
    @IBOutlet weak var yesRadioBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        vehicleLbl.textColor = Color.App_theme_color
        lbl2.textColor = Color.App_theme_color
        yesLbl.textColor = Color.App_theme_color
        noLbl.textColor = Color.App_theme_color
        
        nextBtn.setButtonTheme()

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
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post5ViewController") as! Post5ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    

}
