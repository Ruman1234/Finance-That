//
//  MyAdsViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class MyAdsViewController: UIViewController {

    @IBOutlet weak var myAdsLbl: UILabel!
    @IBOutlet weak var myAdsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myAdsTableView.delegate = self
        myAdsTableView.dataSource = self
    }

    @IBAction func backBtn(_ sender: Any) {
    }
}

extension MyAdsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let adsCell = tableView.dequeueReusableCell(withIdentifier: "adsCell", for: indexPath) as! MyAdsTableViewCell
        adsCell.carImg.layer.cornerRadius = 5
        return adsCell
    }
    
    
    
}
