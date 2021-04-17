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
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = [findModelTableData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nextBtn.setButtonTheme()
        findSetBtn()
    }
    
    func findSetBtn() {
        attachBtn.layer.backgroundColor = UIColor(red: 0.984, green: 0.318, blue: 0, alpha: 1).cgColor

        attachBtn.layer.cornerRadius = 5
    }
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    

    func findAd(ads:String)  {
        NetworkManager.SharedInstance.FindADs(add: ads) { (res) in
            guard let response = res.data else{
                Utilities.ShowAlert(title: "Alert!!!", message: "detail: not found", view: self)
                return
            }
            self.tableData.append(findModelTableData(nameLBl: "Stock", dataLbl: "\(response.stock_id ?? 0)"))
            self.tableData.append(findModelTableData(nameLBl: "Make", dataLbl: response.make?.make_name ?? ""))
            self.tableData.append(findModelTableData(nameLBl: "Model", dataLbl: response.model?.model_make ?? ""))
            self.tableData.append(findModelTableData(nameLBl: "Trim", dataLbl: response.trim ?? ""))
            self.tableData.append(findModelTableData(nameLBl: "Price", dataLbl: response.price ?? ""))
            self.tableView.reloadData()
        } failure: { (err) in
            Utilities.ShowAlert(title: "Alert!!!", message: "Something went wrong", view: self)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "post10cell") as! Post10TableViewCell
        cell.lbl1.text = tableData[indexPath.row].nameLBl
        cell.lbl2.text = tableData[indexPath.row].dataLbl
        cell.tbleview.layer.cornerRadius = 5
        return cell
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func attachBtn(_ sender: Any) {
        self.findAd(ads: stockNumTextField.text ?? "")
    }
    
    func validInput() -> Bool {
        var flag = true
        if stockNumTextField.text!.isEmpty {
            createAlert(title: nil, message: "Please enter Stock Amount")
            flag = false
        }
        return flag
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if self.validInput() {
            PostApplicaitonObject.mainObject["stock"] = stockNumTextField.text
            let main = self.storyboard?.instantiateViewController(withIdentifier: "Post7ViewController") as! Post7ViewController
            main.isHideAmountFields = true
            self.navigationController?.pushViewController(main, animated: true)
        }
    }
}
struct findModelTableData {
    var nameLBl : String
    var dataLbl : String
}
