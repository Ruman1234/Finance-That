//
//  Post9ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class Post9ViewController: UIViewController {

    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var doLbl: UILabel!
    @IBOutlet weak var yesLbl: UILabel!
    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var yesRadioBtn: UIButton!
    @IBOutlet weak var noRadioBtn: UIButton!
    @IBOutlet weak var listingLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var listingBtn: UIButton!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLbl.textColor = Color.App_theme_color
        doLbl.textColor = Color.App_theme_color
        yesLbl.textColor = Color.App_theme_color
        listingLbl.textColor = Color.App_theme_color
        
        listingBtn.setTitleColor(Color.App_theme_color, for: .normal)
        listingBtn.layer.backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        listingBtn.layer.cornerRadius = 5
        listingBtn.layer.borderWidth = 1
        listingBtn.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.933, alpha: 1).cgColor
        

        nextBtn.setButtonTheme()
        
        dropDown.anchorView = listingBtn // UIView or UIBarButtonItem

        dropDown.width = 400
                // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Vehicle listed on Finance That", "Vehicle Sold Somewhere else"]
                
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    
                    if index == 0 {
                        self.listingBtn.setTitle("Vehicle listed on Finance That", for: .normal)
                        
                    }else if index == 1 {
                        self.listingBtn.setTitle("Vehicle Sold Somewhere else", for: .normal)

                    }
    }
}
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post10ViewController") as! Post10ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    @IBAction func listingBtn(_ sender: Any) {
        
        self.dropDown.show()
    }
    
}

