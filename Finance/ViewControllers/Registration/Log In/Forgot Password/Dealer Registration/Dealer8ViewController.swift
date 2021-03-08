//
//  Dealer8ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer8ViewController: UIViewController {

    @IBOutlet weak var goToHomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToHomeBtn.setTitleColor(Color.white_theme_color, for: .normal)
        goToHomeBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        goToHomeBtn.layer.cornerRadius = 10

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    @IBAction func goToHomeBtn(_ sender: Any) {
        
        
    }
    
}
