//
//  UserRegPage2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserRegPage2ViewController: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 16
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserRegPg3ViewController") as! UserRegPg3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserRegPg3ViewController") as! UserRegPg3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
