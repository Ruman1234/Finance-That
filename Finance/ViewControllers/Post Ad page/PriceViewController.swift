//
//  PriceViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController {

    @IBOutlet weak var priceTextField: CustomTextField!
    @IBOutlet weak var kilometersTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.setButtonTheme()
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let main = storyboard?.instantiateViewController(withIdentifier: "BodyTypeViewController") as! BodyTypeViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
}
