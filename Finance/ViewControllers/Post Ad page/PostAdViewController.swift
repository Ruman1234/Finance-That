//
//  PostAdViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 06/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class PostAdViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var carDetailsEditBtn: UIButton!
    @IBOutlet weak var carFeaturesEditBtn: UIButton!
    @IBOutlet weak var adDetailsEditBtn: UIButton!
    @IBOutlet weak var contactEditBtn: UIButton!
    @IBOutlet weak var postAdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView(view: view1)
        setView(view: view2)
        setView(view: view3)
        setView(view: view4)

        setEditBtn(button: carDetailsEditBtn)
        setEditBtn(button: carFeaturesEditBtn)
        setEditBtn(button: adDetailsEditBtn)
        setEditBtn(button: contactEditBtn)
        
        postAdBtn.setButtonTheme()
    }
    
    func setView(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.941, alpha: 1).cgColor
    }
    
    func setEditBtn(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.961, alpha: 1).cgColor
        button.layer.cornerRadius = 5
    }

    @IBAction func crossbtn(_ sender: Any) {
    }
    
    @IBAction func postAdBtn(_ sender: Any) {
    }
    
    @IBAction func discardBtn(_ sender: Any) {
    }
}
