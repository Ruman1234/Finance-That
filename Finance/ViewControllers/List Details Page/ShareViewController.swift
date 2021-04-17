//
//  ShareViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 02/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var ShareToView: UIView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShareToView.layer.cornerRadius = 30
        
        shareBtn.setButtonTheme()
        self.design(btn: cancelBtn)
        
    }
    
    func design(btn :UIButton)  {
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 19
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.red_theme_color.cgColor
        btn.setTitleColor(Color.red_theme_color, for: .normal)
    }
    
    @IBAction func shareBtn(_ sender: Any) {
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
