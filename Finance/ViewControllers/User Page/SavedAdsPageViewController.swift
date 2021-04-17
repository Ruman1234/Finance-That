//
//  SavedAdsPageViewController.swift
//  Finance
//
//  Created by Ammar Irfan on 29/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit

class SavedAdsPageViewController: UIViewController {

    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var userProfileLbl: UILabel!
    @IBOutlet weak var savedAds: UILabel!
    @IBOutlet weak var savedAdsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileLbl.textColor = Color.App_theme_color
        editBtn.setTitleColor(Color.primary_theme_color, for: .normal)
        nameLbl.textColor = Color.App_theme_color
        userProfileLbl.textColor = Color.gray_theme_color
        savedAds.textColor = Color.App_theme_color
        
        savedAdsTableView.delegate = self
        savedAdsTableView.dataSource = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func editBtn(_ sender: Any) {
    }
}


extension SavedAdsPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! SavedAdsTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
