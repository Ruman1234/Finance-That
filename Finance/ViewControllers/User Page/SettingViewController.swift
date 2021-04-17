//
//  SettingViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 09/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    let imgsArr = [UIImage(named: "girl"),UIImage(named: "about"),UIImage(named: "about"),UIImage(named: "about"),UIImage(named: "contactUs"),UIImage(named: "bell"),UIImage(named: "file"),UIImage(named: "file"),UIImage(named: "logOut"),]
    
    let lblArr = ["My Profile","Help","FAQ","About","Contact Us","Notification Preferences","Privacy Policy","Terms of Service","Log Out",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        cell.img.image = imgsArr[indexPath.row]
        cell.lbl.text = lblArr[indexPath.row]
        cell.img.setRoundView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
