//
//  DescriptionViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
        nextBtn.setButtonTheme()
    }
    
    func setTextView() {
        descriptionTextView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = UIColor(red: 0.784, green: 0.792, blue: 0.8, alpha: 1).cgColor
        descriptionTextView.textColor = UIColor(red: 0.51, green: 0.514, blue: 0.522, alpha: 1)
        descriptionTextView.font = UIFont(name: "BasisGrotesquePro-Regular", size: 13)
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let main = storyboard?.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
