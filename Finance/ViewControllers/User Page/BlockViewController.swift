//
//  BlockViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 30/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    @IBOutlet weak var blockView: UIView!
    
    @IBOutlet weak var blockLbl: UILabel!
    @IBOutlet weak var deleteLbl: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var blockBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blockView.layer.cornerRadius = 10
        
        blockLbl.textColor = Color.App_theme_color
        deleteLbl.textColor = Color.App_theme_color
        
        deleteBtn.setTitleColor(Color.primary_theme_color, for: .normal)
        blockBtn.setButtonTheme()
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
    }
    
    @IBAction func blockBtn(_ sender: Any) {
    }
    
}
