//
//  NotificationsViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notfiticationLbl: UILabel!
    @IBOutlet weak var notificationTableView: UITableView!
    
    let imgArr = [UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),UIImage(named: "girl"),]
    
    let nameArr = ["Jeannette Shelton","Devon Watson","Bessie Mccoy","Jeannette Shelton","Jeannette Shelton","Jeannette Shelton","Jeannette Shelton","Jeannette Shelton",]
    
    let messageArr = ["Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you","Hi John, Wants to talk to you",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
        cell.profileImg.image = imgArr[indexPath.row]
        cell.name.text = nameArr[indexPath.row]
        cell.messageLbl.text = messageArr[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let main = self.storyboard?.instantiateViewController(withIdentifier: "MyApplicationsPageViewController") as! MyApplicationsPageViewController
            self.navigationController?.pushViewController(main, animated: true)

        }
    }
}
