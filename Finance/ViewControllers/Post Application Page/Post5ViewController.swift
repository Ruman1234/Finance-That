//
//  Post5ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post5ViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var yearTextField: CustomTextField!
    @IBOutlet weak var makeTextField: CustomTextField!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var modelTextField: CustomTextField!
    @IBOutlet weak var kmLbl: UILabel!
    @IBOutlet weak var kmTextField: CustomTextField!
    @IBOutlet weak var vinLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var vinTextField: CustomTextField!
    @IBOutlet weak var conditionTextField: CustomTextField!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceTextField: CustomTextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLbl.textColor = Color.App_theme_color
        yearLbl.textColor = Color.App_theme_color
        makeLbl.textColor = Color.App_theme_color
        modelLbl.textColor = Color.App_theme_color
        kmLbl.textColor = Color.App_theme_color
        vinLbl.textColor = Color.App_theme_color
        conditionLbl.textColor = Color.App_theme_color
        priceLbl.textColor = Color.App_theme_color
        
        nextBtn.setTitleColor(Color.white_theme_color, for: .normal)
        nextBtn.layer.backgroundColor = Color.red_theme_color.cgColor
        nextBtn.layer.cornerRadius = 10

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        scroller.isScrollEnabled = true
        scroller.contentSize = CGSize(width: 400, height: 900)
    }
    


    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post6ViewController") as! Post6ViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
}
