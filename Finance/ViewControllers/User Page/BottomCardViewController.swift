//
//  BottomCardViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class BottomCardViewController: UIViewController {

    @IBOutlet weak var bottomCardTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    let LblNamesArr = ["BLock","Delete","Archive","Mute Notifications","Create Shortcut","Cancel"]

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomCardTableView.delegate = self
        bottomCardTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        let height = bottomCardTableView.contentSize.height
        if height > 500{
            tableViewHeight.constant = 500
        }else{
            tableViewHeight.constant = bottomCardTableView.contentSize.height
        }
        bottomCardTableView.layoutIfNeeded()
        self.bottomCardTableView.reloadData()
    }
}

extension BottomCardViewController: UITableViewDelegate, UITableViewDataSource{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return LblNamesArr.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionSheetTableViewCell", for: indexPath) as! ActionSheetTableViewCell
            cell.lbl.text = LblNamesArr[indexPath.row]
            return cell
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
                let main = self.storyboard?.instantiateViewController(withIdentifier: "BlockViewController") as! BlockViewController
                main.modalPresentationStyle = .overCurrentContext
                main.modalTransitionStyle = .crossDissolve
                present(main, animated: true, completion: nil)
            }
            self.dismiss(animated: true, completion: nil)
        }
    
}
