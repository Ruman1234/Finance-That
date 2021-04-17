//
//  FeaturesViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 03/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class FeaturesViewController: UIViewController {

    @IBOutlet weak var featuresTableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featuresTableView.delegate = self
        featuresTableView.dataSource = self
        
        nextBtn.setButtonTheme()
    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
    @IBAction func radioBtn(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }
}

extension FeaturesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturesTableViewCell", for: indexPath) as! FeaturesTableViewCell
        return cell
    }
}
