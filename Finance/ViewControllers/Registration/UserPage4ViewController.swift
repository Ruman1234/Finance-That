//
//  UserPage4ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserPage4ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var homePageBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePageBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        homePageBtn.layer.cornerRadius = 10
        homePageBtn.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func homePgBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
