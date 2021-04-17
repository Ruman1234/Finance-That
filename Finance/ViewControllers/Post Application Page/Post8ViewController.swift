//
//  Post8ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post8ViewController: UIViewController {

    @IBOutlet weak var goToHomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goToHomeBtn.setButtonTheme()
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func goToHomeBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post9ViewController") as! Post9ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
}
