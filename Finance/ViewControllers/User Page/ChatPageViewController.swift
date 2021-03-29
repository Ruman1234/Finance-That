//
//  ChatPageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ChatPageViewController: UIViewController {

    @IBOutlet weak var chatLbl: UILabel!
    
    @IBOutlet weak var chatPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatPageTableView.delegate = self
        chatPageTableView.dataSource = self
    }

    @IBAction func backBtn(_ sender: Any) {
    }
}

extension ChatPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatPageTableViewCell", for: indexPath) as! ChatPageTableViewCell
        return cell
    }
    
    
}
