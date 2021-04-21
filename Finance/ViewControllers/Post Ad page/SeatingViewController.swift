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
        dropDown.dataSource = ["1", "2","3","4","5"]
                
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    
                    if index == 0 {
                        self.seatingTxtField.text = "1"
                        let main = storyboard?.instantiateViewController(withIdentifier: "TransmisssionViewController") as! TransmisssionViewController
                        self.navigationController?.pushViewController(main, animated: true)

                    }else if index == 1 {
                        self.seatingTxtField.text = "2"

                    }else if index == 2 {
                        self.seatingTxtField.text = "3"

                    }else if index == 3 {
                        self.seatingTxtField.text = "4"

                    }else if index == 4 {
                        self.seatingTxtField.text = "5"
                    }
    }
    }

    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func seatingDropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
}
