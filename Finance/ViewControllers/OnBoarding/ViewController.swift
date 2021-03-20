//
//  ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 24/02/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
        view1.layer.cornerRadius = 4
        view2.layer.cornerRadius = 4
        view3.layer.cornerRadius = 4

    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func skipBtn(_ sender: Any) {
    
//        let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage1ViewController") as! UserPage1ViewController
//        self.navigationController?.pushViewController(main, animated: true)
        
        let homePageStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let main =
            homePageStoryBoard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if lbl1.text == "Pictures & Videos" {
           
            lbl1.text = "Confused between choices?"
            lbl2.text = "Compare Cars"
            lbl3.text = "Compare to choose the right car!"
            img.image = UIImage(named: "Frame")
            view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor

        }else if lbl1.text == "Confused between choices?"{
            lbl1.text = "Get best deals"
            lbl2.text = "Prices and Offers"
            lbl3.text = "We bring accurate price & best offers to you!"
            img.image = UIImage(named: "Group")
            view1.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view2.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor
            view3.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor

        }else {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "UserPage1ViewController") as! UserPage1ViewController
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
}
