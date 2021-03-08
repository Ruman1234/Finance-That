//
//  Dealer1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 01/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Dealer1ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var recreationalBtn: UIButton!
    @IBOutlet weak var automotiveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recreationalBtn.backgroundColor = Color.lightgray_theme_color
        recreationalBtn.layer.cornerRadius = 10

        automotiveBtn.backgroundColor = Color.lightgray_theme_color
        automotiveBtn.layer.cornerRadius = 10

    }
    

    @IBAction func recreationalBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer2ViewController") as! Dealer2ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func automotiveBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer2ViewController") as! Dealer2ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
