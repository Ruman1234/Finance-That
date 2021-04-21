//
//  VinNumberViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class VinNumberViewController: UIViewController {

    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var vinNumberTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let main = storyboard?.instantiateViewController(withIdentifier: "PriceViewController") as! PriceViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
