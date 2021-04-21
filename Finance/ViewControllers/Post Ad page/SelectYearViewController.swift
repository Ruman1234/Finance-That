//
//  SelectYearViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SelectYearViewController: UIViewController {

    @IBOutlet weak var selectYearTableView: UITableView!
    
    let arr = ["2018","2019","2020"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectYearTableView.delegate = self
        selectYearTableView.dataSource = self
    }

}

extension SelectYearViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectYearTableViewCell", for: indexPath) as! SelectYearTableViewCell
        cell.yearLabel.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let main = storyboard?.instantiateViewController(withIdentifier: "SelectConditionViewController") as! SelectConditionViewController
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
}
