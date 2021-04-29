//
//  SeatingViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class SeatingViewController: UIViewController {
    
    @IBOutlet weak var seatingTxtField: CustomTextField!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = seatingTxtField // UIView or UIBarButtonItem
        
        dropDown.width = 400
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = [ "2","4","5","6","8","10+"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            self.seatingTxtField.text = item
            let main = storyboard?.instantiateViewController(withIdentifier: "TransmisssionViewController") as! TransmisssionViewController
            self.navigationController?.pushViewController(main, animated: true)
            
        }
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func seatingDropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
}
