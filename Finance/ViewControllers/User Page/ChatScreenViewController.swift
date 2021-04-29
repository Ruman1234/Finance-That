//
//  ChatScreenViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 22/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class ChatScreenViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var ellipseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.delegate = self
        chatTableView.dataSource = self
    }

    @IBAction func backBtn(_ sender: Any) {
        
    }
    
    @IBAction func phoneBtn(_ sender: Any) {
    }
    @IBAction func videoBtn(_ sender: Any) {
    }
    @IBAction func ellipseBtn(_ sender: Any) {
    }
}

extension ChatScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "John SMith"
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    
}
