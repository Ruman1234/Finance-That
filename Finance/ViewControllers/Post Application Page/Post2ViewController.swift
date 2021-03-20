//
//  Post2ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post2ViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var houseLbl: UILabel!
    @IBOutlet weak var houseTextField: CustomTextField!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var streetTextField: CustomTextField!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var provinceLbl: UILabel!
    @IBOutlet weak var provinceTextField: CustomTextField!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var durationTextField: CustomTextField!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var statusTextField: CustomTextField!
    @IBOutlet weak var provideLbl: UILabel!
    @IBOutlet weak var provideTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.textColor = Color.App_theme_color
        houseLbl.textColor = Color.App_theme_color
        streetLbl.textColor = Color.App_theme_color
        cityLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color
        durationLbl.textColor = Color.App_theme_color
        statusLbl.textColor = Color.App_theme_color
        provinceLbl.textColor = Color.App_theme_color

        nextBtn.setButtonTheme()

    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: self.view.frame.width, height: 900)
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
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post3ViewController") as! Post3ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
