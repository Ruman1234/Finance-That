//
//  Post3ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post3ViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var empStatusLbl: UILabel!
    @IBOutlet weak var statusTextField: CustomTextField!
    @IBOutlet weak var empHourLbl: UILabel!
    @IBOutlet weak var hourTextField: CustomTextField!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var occupationTextField: CustomTextField!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var durationTextField: CustomTextField!
    @IBOutlet weak var grossLbl: UILabel!
    @IBOutlet weak var grossTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        empStatusLbl.textColor = Color.App_theme_color
        empHourLbl.textColor = Color.App_theme_color
        occupationLbl.textColor = Color.App_theme_color
        durationLbl.textColor = Color.App_theme_color
        grossLbl.textColor = Color.App_theme_color
        
        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: 400, height: 800)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post4ViewController") as! Post4ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
