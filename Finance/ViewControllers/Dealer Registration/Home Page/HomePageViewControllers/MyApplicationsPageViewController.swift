//
//  MyApplicationsPageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 22/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class MyApplicationsPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var applicationLbl: UILabel!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var applicationTableView: UITableView!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var approvedLbl: UILabel!
    @IBOutlet weak var preApprovedLbl: UILabel!
    @IBOutlet weak var declineLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicationTableView.delegate = self
        applicationTableView.dataSource = self
        
        applicationLbl.textColor = Color.App_theme_color
        conditionLbl.textColor = Color.App_theme_color
        approvedLbl.textColor = Color.App_theme_color
        preApprovedLbl.textColor = Color.App_theme_color
        declineLbl.textColor = Color.App_theme_color

        blueView.layer.backgroundColor = Color.blue_View_color
        orangeView.layer.backgroundColor = Color.orange_View_color
        greenView.layer.backgroundColor = Color.green_View_color
        redView.layer.backgroundColor = Color.red_View_color
        
        blueView.setRoundView()
        orangeView.setRoundView()
        greenView.setRoundView()
        redView.setRoundView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "applicationCell", for: indexPath) as! MyApplicationPageTableViewCell
        return cell
        
    }
    @IBAction func viewBtn(_ sender: Any) {
        
        let main = self.storyboard?.instantiateViewController(withIdentifier: "MyApplicationDetailViewController") as! MyApplicationDetailViewController
        self.navigationController?.pushViewController(main, animated: true)

    }
    
}
