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
    
    var featuresArraay = [FeaturesData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featuresTableView.delegate = self
        featuresTableView.dataSource = self
        
        nextBtn.setButtonTheme()
        
        PostAdNetworkManager.SharedInstance.Features(viewcontroller: self) { (res) in
            print(res)
            guard let arr = res.data else{return}
            self.featuresArraay = arr
            self.featuresTableView.reloadData()
        } failure: { (err) in
            print("Failed")
        }

    }
    
    @IBAction func crossBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let main = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        self.navigationController?.pushViewController(main, animated: true)

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
        return featuresArraay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturesTableViewCell", for: indexPath) as! FeaturesTableViewCell
        cell.radioLbl.text = featuresArraay[indexPath.row].v_features
        return cell
    }
}
