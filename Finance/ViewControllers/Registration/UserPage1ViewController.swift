//
//  UserPage1ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 25/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class UserPage1ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var buyerBtn: UIButton!
    @IBOutlet weak var dealerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        buyerBtn.layer.backgroundColor = UIColor(red: 0.965, green: 0.973, blue: 0.984, alpha: 1).cgColor
        buyerBtn.layer.cornerRadius = 10
        
        dealerBtn.layer.backgroundColor = UIColor(red: 0.965, green: 0.973, blue: 0.984, alpha: 1).cgColor
        dealerBtn.layer.cornerRadius = 10
        
        buyerBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 100)
        
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func buyerAndSellerBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage2ViewController") as! UserPage2ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
    @IBAction func dealershipBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Dealer1ViewController") as! Dealer1ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
