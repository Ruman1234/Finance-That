//
//  DurationAddressViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 15/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class DurationAddressViewController: UIViewController {

    @IBOutlet weak var yearsTextField: CustomTextField!
    @IBOutlet weak var monthsTextField: CustomTextField!
    @IBOutlet weak var statusTextField: CustomTextField!
    @IBOutlet weak var mortageTextField: CustomTextField!
    
    @IBOutlet weak var statusDropDownBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var mortageLbl: UILabel!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.setButtonTheme()
        
        dropDown.anchorView = statusDropDownBtn // UIView or UIBarButtonItem
        DropDown.appearance().textColor = Color.App_theme_color
        DropDown.appearance().selectedTextColor = Color.App_theme_color
        DropDown.appearance().textFont = UIFont(name: "Basis Grotesque Pro Medium", size: 15)!
        DropDown.appearance().backgroundColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1)
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 0.98, green: 0.933, blue: 0.918, alpha: 1)
        dropDown.width = self.statusDropDownBtn.frame.width
                // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Owned", "Rent", "Live with Partners", "Other"]
                
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    unHide()
                    if index == 0 {
                        self.statusTextField.text = "Owned"
                    }else if index == 1 {
                        self.statusTextField.text = "Rent"
                    }else if index == 2 {
                        self.statusTextField.text = "Live with Partners"
                        mortageLbl.isHidden = true
                        mortageTextField.isHidden = true
                        
                    }else if index == 3 {
                        self.statusTextField.text = "Other"
                    }
        }
    }
    
    func unHide()  {
        mortageLbl.isHidden = false
        mortageTextField.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if PostApplicaitonObject.IsCoApplicant{
            self.setData(dict: &PostApplicaitonObject.coAppObject)
        }else{
            self.setData(dict: &PostApplicaitonObject.mainObject)
        }
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "Post3ViewController") as! Post3ViewController
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    func setData(dict:inout [String : Any]) {
        dict["duration_address_yr"]         = self.yearsTextField.text    ?? ""
        dict["duration_address_mn"]         = self.monthsTextField.text   ?? ""
        dict["status"]                      = self.statusTextField.text   ?? ""
        dict["mortgage_amount"]             = self.mortageTextField.text  ?? ""
    }
    
    @IBAction func statusDropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
}
