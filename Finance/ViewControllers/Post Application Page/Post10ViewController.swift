//
//  Post10ViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 07/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class Post10ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var vehicleLbl: UILabel!
    @IBOutlet weak var pleaseLbl: UILabel!
    @IBOutlet weak var stockNumTextField: CustomTextField!
    @IBOutlet weak var attachBtn: UIButton!
    @IBOutlet weak var vehicleFoundLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    let arr = ["Stock :","Make :","Model :","Trim :","Price :"]
    let arr2 = ["102232","Honda","Accord","Exl","$18000"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "post10cell") as! Post10TableViewCell
        cell.lbl1.text = arr[indexPath.row]
        cell.lbl2.text = arr2[indexPath.row]
        return cell
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func attachBtn(_ sender: Any) {
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
}
