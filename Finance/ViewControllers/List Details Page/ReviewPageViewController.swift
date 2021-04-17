//
//  ReviewPageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 31/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import DropDown

class ReviewPageViewController: UIViewController {

    @IBOutlet weak var reviewPageTableView: UITableView!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewPageTableView.delegate = self
        reviewPageTableView.dataSource = self
        
//        dropDown.anchorView = dropDownBtn // UIView or UIBarButtonItem

        dropDown.width = 400
                // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Share", "Report a problem"]
                // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    if index == 0 {
                        print("0")
                    }else if index == 1 {
                        let main = self.storyboard?.instantiateViewController(withIdentifier: "ReportProblemViewController") as! ReportProblemViewController
                        main.modalPresentationStyle = .overCurrentContext
                        main.modalTransitionStyle = .crossDissolve
                        present(main, animated: true, completion: nil)                    }
                }
    }

    @IBAction func dropDownBtn(_ sender: Any) {
        self.dropDown.show()
    }
}

extension ReviewPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewPageTableViewCell", for: indexPath) as! ReviewPageTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
}
