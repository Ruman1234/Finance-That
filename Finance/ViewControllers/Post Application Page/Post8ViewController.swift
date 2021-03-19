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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    @IBAction func goToHomeBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post9ViewController") as! Post9ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
}
